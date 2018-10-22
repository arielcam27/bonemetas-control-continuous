import numpy as np
from matplotlib import pyplot as plt
import sys

plt.rcParams['text.usetex'] = True
plt.rcParams['text.latex.unicode'] = True

# -> parametros
# fijos
a1=0.5;a2=0.05;b1=0.2;b2=0.02;g1=-0.3;g2=0.7;K=10000.0;b3=0.0;c2=0.0;

#----------------------------------------------------
# eq invasion
#B1 = b1/a3; B2 = b2/a3; B3 = b3/a3;
#K1 = c1*K/a3; K2 = c2*K/a3; K3 = c3/a2; K4 = c4/a1;
#
## -> eq invasion
#v3 = (-B3 + 1. + K3*B2 + K4*B1)/(1. + K2*K3 + K1*K4)
#----------------------------------------------------

# subir b3
# bajar a3 !!!!
# bajar c3 !!
# subir a2 !!
# bajar b2 SI c3 > 0
# bajar c4 (biol !)
# subir b1 SI c4 > 0
# subir c2 SI c3 > 0
# subir c1 SI c4 > 0
# subir a1 SI c4 > 0

# MATLAB
# SIM01
#a3=1.5e-2;c1=1.e-6;c3=1e-3;c4=0.0;rango=[0e4,2e4];

# SIM02
#a3=1.0e-4;c1=1.e-6;c3=1e-3;c4=0.0;rango=[4e4,6e4];

# SIM03
a3=1.e-4;c1=0.0;c3=1.e-8;c4=-1.e-4;rango=[0e4,7e3];


#-------------------------------------------------------------------------------
def RH():
    # --- criterio RH
    # -> adimensionales
    B1 = b1/a3; B2 = b2/a3;B3 = b3/a3
    K1 = c1*K/a3; K2 = c2*K/a3; K3 = c3/a2; K4 = c4/a1
    
    # -> eq libre
    v3 = 0.; v1 = (B2)**(1./g2); v2 = (B1)**(1./g1)
    x1eqlibre = v1*(a3/a2)**(1./g2)
    x2eqlibre = v2*(a3/a1)**(1./g1)
    x3eqlibre = 0.
    
    # -> eq invasion
    v3 = (-B3 + 1. + K3*B2 + K4*B1)/(1. + K2*K3 + K1*K4)
    v1 = (B2 - K2*v3)**(1./g2)
    v2 = (B1 - K1*v3)**(1./g1)
    x1eqinv = v1*(a3/a2)**(1./g2)
    x2eqinv = v2*(a3/a1)**(1./g1)
    x3eqinv = v3*K
    
    # --- coeficientes para criterio
    aa1 =-B1*K4 \
         -B2*K3 \
         +B3 \
         +K1*K4*v3 \
         +K2*K3*v3 \
         +2.*v3 \
         -1.
    aa2 = -B1*B2*g1*g2 \
         -B1*K2*K4*g1*v3 \
         +B1*K2*g1*g2*v3 \
         -B2*K1*K3*g2*v3 \
         +B2*K1*g1*g2*v3 \
         +K1*K2*K3*g2*v3**2 \
         +K1*K2*K4*g1*v3**2 \
         -K1*K2*g1*g2*v3**2
    aa3 = +B1**2*B2*K4*g1*g2 \
         -B1**2*K2*K4*g1*g2*v3 \
         +B1*B2**2*K3*g1*g2 \
         -B1*B2*B3*g1*g2 \
         -3.*B1*B2*K1*K4*g1*g2*v3 \
         -3.*B1*B2*K2*K3*g1*g2*v3 \
         -2.*B1*B2*g1*g2*v3 \
         +B1*B2*g1*g2 \
         +B1*B3*K2*g1*g2*v3 \
         +3.*B1*K1*K2*K4*g1*g2*v3**2 \
         +2.*B1*K2**2*K3*g1*g2*v3**2 \
         +2.*B1*K2*g1*g2*v3**2 \
         -B1*K2*g1*g2*v3 \
         -B2**2*K1*K3*g1*g2*v3 \
         +B2*B3*K1*g1*g2*v3 \
         +2.*B2*K1**2*K4*g1*g2*v3**2 \
         +3.*B2*K1*K2*K3*g1*g2*v3**2 \
         +2.*B2*K1*g1*g2*v3**2 \
         -B2*K1*g1*g2*v3 \
         -B3*K1*K2*g1*g2*v3**2 \
         -2.*K1**2*K2*K4*g1*g2*v3**3 \
         -2.*K1*K2**2*K3*g1*g2*v3**3 \
         -2.*K1*K2*g1*g2*v3**3 \
         +K1*K2*g1*g2*v3**2
    
    RH1 = aa1*aa2 - aa3
    RH2 = aa1
    RH3 = aa3
    
    print('-> equilibrio libre de cancer:')
    print 'x1: %f'  %x1eqlibre
    print 'x2: %f'  %x2eqlibre
    print 'x3: %f'  %x3eqlibre
    print('')
    
    print('-> equilibrio de invasion:')
    print 'x1: %f'  %x1eqinv
    print 'x2: %f'  %x2eqinv
    print 'x3: %f'  %x3eqinv
    print('')
    
    print('-> Criterio RH')
    print('Es eq invasion localmente estable?')
    test_rh1 = RH1>0 and RH2>0 and RH3>0
    if test_rh1:
        print 'SI'
    else:
        print 'NO'
    print('')
    
    print('-> Teorema 2')
    print('Es eq libre localmente estable?')
    lefthand = b2*c3/a2 + b1*c4/a1
    righthand = b3 - a3
    test_rh2 = lefthand<righthand
    if test_rh2:
        print 'SI'
    else:
        print 'NO'
    print('')
    return

def obtenereq(a1,a2,b1,b2,g1,g2,K,a3,b3,c1,c2,c3,c4):
    B1 = b1/a3; B2 = b2/a3;B3 = b3/a3
    K1 = c1*K/a3; K2 = c2*K/a3; K3 = c3/a2; K4 = c4/a1
    
    # -> eq invasion
    v3 = (-B3 + 1. + K3*B2 + K4*B1)/(1. + K2*K3 + K1*K4)
    v1 = (B2 - K2*v3)**(1./g2)
    v2 = (B1 - K1*v3)**(1./g1)
    x1eqinv = v1*(a3/a2)**(1./g2)
    x2eqinv = v2*(a3/a1)**(1./g1)
    x3eqinv = v3*K
    
    # --- coeficientes para criterio
    aa1 =-B1*K4 \
         -B2*K3 \
         +B3 \
         +K1*K4*v3 \
         +K2*K3*v3 \
         +2.*v3 \
         -1.
    aa2 = -B1*B2*g1*g2 \
         -B1*K2*K4*g1*v3 \
         +B1*K2*g1*g2*v3 \
         -B2*K1*K3*g2*v3 \
         +B2*K1*g1*g2*v3 \
         +K1*K2*K3*g2*v3**2 \
         +K1*K2*K4*g1*v3**2 \
         -K1*K2*g1*g2*v3**2
    aa3 = +B1**2*B2*K4*g1*g2 \
         -B1**2*K2*K4*g1*g2*v3 \
         +B1*B2**2*K3*g1*g2 \
         -B1*B2*B3*g1*g2 \
         -3.*B1*B2*K1*K4*g1*g2*v3 \
         -3.*B1*B2*K2*K3*g1*g2*v3 \
         -2.*B1*B2*g1*g2*v3 \
         +B1*B2*g1*g2 \
         +B1*B3*K2*g1*g2*v3 \
         +3.*B1*K1*K2*K4*g1*g2*v3**2 \
         +2.*B1*K2**2*K3*g1*g2*v3**2 \
         +2.*B1*K2*g1*g2*v3**2 \
         -B1*K2*g1*g2*v3 \
         -B2**2*K1*K3*g1*g2*v3 \
         +B2*B3*K1*g1*g2*v3 \
         +2.*B2*K1**2*K4*g1*g2*v3**2 \
         +3.*B2*K1*K2*K3*g1*g2*v3**2 \
         +2.*B2*K1*g1*g2*v3**2 \
         -B2*K1*g1*g2*v3 \
         -B3*K1*K2*g1*g2*v3**2 \
         -2.*K1**2*K2*K4*g1*g2*v3**3 \
         -2.*K1*K2**2*K3*g1*g2*v3**3 \
         -2.*K1*K2*g1*g2*v3**3 \
         +K1*K2*g1*g2*v3**2
    
    RH1 = aa1*aa2 - aa3
    RH2 = aa1
    RH3 = aa3
    
#    print('-> Criterio RH')
#    print('Es eq invasion localmente estable?')
    test_rh1 = RH1>0 and RH2>0 and RH3>0
    if test_rh1:
#        print 'SI'
        flag = True
    else:
#        print 'NO'
        flag = False
    
    return x1eqinv, x2eqinv, x3eqinv, flag

#fig, ax = plt.subplots(3, sharex=True)
#
#ax[0].set_title('Bifurcation diagram in $c_3$ parameter')
#ax[0].set_ylabel('x1* (OC)')
#ax[0].yaxis.set_label_position("right")
#ax[1].set_ylabel('x2* (OB)')
#ax[1].yaxis.set_label_position("right")
#ax[2].set_ylabel('x3* (CC)')
#ax[2].yaxis.set_label_position("right")
#
#for i in range(3):
#    ax[i].plot(bif[x0cancer[3,:]==True],x0cancer[i][:][x0cancer[3,:]==True],'b',linewidth=2)
#    ax[i].plot(bif[x0cancer[3,:]==False],x0cancer[i][:][x0cancer[3,:]==False],'r--',linewidth=2)
#    ax[i].axvline(x=0,color='gray')
#    ax[i].ticklabel_format(style='sci', axis='y', scilimits=(0,0))

#%%
#sin variaciones en parametros

RH()

#-------------------------

bifl = 0.0;bifr = 0.6;
bif = np.linspace(bifl,bifr,2e2);x0cancer = np.zeros((4,len(bif)))

for i in range(len(bif)):
    x0cancer[:,i] = obtenereq(a1*(1.-bif[i]),a2,b1,b2,g1,g2,K,a3,b3,c1,c2,c3,c4)

plt.rcParams['text.usetex'] = True 
plt.rcParams['font.family'] = 'serif'
plt.rc('xtick', labelsize=14)
plt.rc('ytick', labelsize=14)
plt.rc('axes',  labelsize=14)

fig, ax = plt.subplots(1)

ax.plot(bif[x0cancer[3,:]==True],x0cancer[2][:][x0cancer[3,:]==True],'k-',linewidth=2, label='Stable')
ax.plot(bif[x0cancer[3,:]==False],x0cancer[2][:][x0cancer[3,:]==False],'k--',linewidth=2,label='Unstable')
ax.axvline(x=0,color='gray')
ax.axhline(y=0,color='gray')
ax.ticklabel_format(style='sci', axis='y', scilimits=(0,0))

plt.xlim([bifl,bifr])
plt.ylim(rango)
plt.tight_layout()
plt.title(r"Scenario 3", fontsize=16)
plt.xlabel(r'Denosumbab $u_D$',fontsize=16)
plt.ylabel(r'Equilibrium in $T(t)$')
plt.legend(('Stable','Unstable'),loc='best',fontsize='medium')

width = 5
height = width / 1.618
fig.set_size_inches(width, height)
plt.tight_layout()
fig.savefig('bifu3.pdf')