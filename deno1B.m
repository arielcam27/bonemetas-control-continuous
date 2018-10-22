function [Tu, X, U, Tx0, X0] = deno1B(Bin,Sc)

% FBSM parameters
TOL = 1e-1;
max_iteration = 50;

% integration parameters
options = odeset('RelTol', 1e-8, 'AbsTol',[1e-8 1e-8 1e-8]);
t0 = 0; tf = 250;
n = tf*10+1;

Tu = linspace(t0, tf, n); % time interval for x, p and u
u = zeros(1,n);

initx = [4.42e-06 4.46 1000.0]; 
initp = [0. 0. 0.];

[a1,a2,b1,b2,g1,g2,K,a3,b3,c1,c2,c3,c4,u_max,B,convx] = pars;

% plot control zero
U(1,:) = u;

figure;
hold on
plot(Tu,U(1,:))
drawnow

for i = 1:max_iteration
    % 1) solve: stateEq (t0, tf), x0=initx, control zero
    [Tx,X] = ode45(@(t,x) stateEq(t,x,u,Tu), [t0 tf], initx, options);
    
    if i==1
        disp('calculating without control')
        Tx0 = Tx;
        X0 = X;
        
        disp('now switching to an initial control')
        %u = u_max*ones(1,n);
        [Tx,X] = ode45(@(t,x) stateEq(t,x,u,Tu), [t0 tf], initx, options);
    end
   
    % 2) solve: costateEq, (tf, t0), p0=initp
    x1 = X(:,1);
    x2 = X(:,2);
    x3 = X(:,3);
    
    [Tp,P] = ode45(@(t,p) costateEq(t,p,u,x1,x2,x3,Tu,Tx), [tf t0], initp, options);
    
    % 3) control update
    p1 = P(:,1);
    p2 = P(:,2);
    p3 = P(:,3);
    
    % get x and p ajusted to times Tu
    x1 = interp1(Tx,x1,Tu);
    x2 = interp1(Tx,x2,Tu);
    x3 = interp1(Tx,x3,Tu);
    
    p1 = interp1(Tp,p1,Tu);
    p2 = interp1(Tp,p2,Tu);
    p3 = interp1(Tp,p3,Tu);
    
    u_old = u;
    u1 = min(u_max, (0.5*a1*p1.*x1.*(x2.^g1))/B);
    u = max(0.0, u1);
    
    ERROR = norm(u_old-u);
    
    u = convx*u+(1-convx)*u_old;
    
    % plot new control
    U(i+1,:) = u;
    plot(Tu,U(i+1,:))
    drawnow

    % 4) cost functional
    disp(i)
    ERROR
    J(i,1) = trapz(Tu,x3.^2) + B*trapz(Tu,u.^2);
    X1(:,i) = interp1(Tx,X(:,1),Tu);
    X2(:,i) = interp1(Tx,X(:,2),Tu);
    X3(:,i) = interp1(Tx,X(:,3),Tu);

    % 5) convergence criterion
    if ERROR < TOL
        % Display final cost
        J(i,1);
       break;
    end
end

if i == max_iteration
    disp('Stopped before required residual is obtained.');
else
    U = u;
    X = [X1(:,i) X2(:,i) X3(:,i)];
    %Tx0
    %X(:,j) j=1,2,3
end

function [a1,a2,b1,b2,g1,g2,K,a3,b3,c1,c2,c3,c4,u_max,B,convx] = pars
    %% default
    a1=0.5;a2=0.05;b1=0.2;b2=0.02;
    g1=-0.3;g2=0.7;
    K=1.e4;
    B = Bin;
    %% change
    switch Sc
        case 1
        % sim01: agressive
        a3=1.5e-2;b3=0.0;c1=1.e-6;c2=0.;c3=1e-3;c4=0.0;u_max = 0.6;convx=0.25;
    
        case 2
        % sim02: remodeling-dependant
        a3=1.0e-4;b3=0.0;c1=1.e-6;c2=0.e-5;c3=1e-3;c4=0.0;u_max = 0.6;convx=0.15;
    
        case 3
        % sim03: 
        a3=1.e-4;b3=0.e-2;c1=0.e-6;c2=0.e-1;c3=1.e-8;c4=-1.e-4;u_max = 0.6;convx=0.3;
    end
     
end

% State equations
function dx = stateEq(t,x,u,Tu)
[a1,a2,b1,b2,g1,g2,K,a3,b3,c1,c2,c3,c4,u_max,B] = pars;
dx = zeros(3,1);
uu = interp1(Tu,u,t);

dx(1) = a1*x(1)*x(2)^g1.*(1-uu) - b1*x(1) + c1*x(1)*x(3);
dx(2) = a2*x(1)^g2*x(2) - b2*x(2) + c2*x(2)*x(3);
dx(3) = a3*x(3)*(1.0 - x(3)/K) - b3*x(3) + c3*x(1)^g2*x(3) + c4*x(2)^g1*x(3);
end

% Costate equations
function dp = costateEq(t,p,u,x1,x2,x3,Tu,Tx)
[a1,a2,b1,b2,g1,g2,K,a3,b3,c1,c2,c3,c4,u_max,B] = pars;
dp = zeros(3,1);
x1 = interp1(Tx,x1,t);
x2 = interp1(Tx,x2,t);
x3 = interp1(Tx,x3,t);
uu = interp1(Tu,u,t);

dp(1) = -( p(1)*( a1*x2^g1*(1-uu) - b1 + c1*x3 )...
        +p(2)*( a2*g2*x1^(g2-1.0)*x2 )...
        +p(3)*( c3*g2*x1^(g2-1.0)*x3 ));
dp(2) = -( p(1)*( a1*g1*x1*x2^(g1-1.0)*(1-uu) )...
        +p(2)*( a2*x1^g2 - b2 + c2*x3 )...
        +p(3)*( c4*g1*x2^(g1-1.0)*x3));             
dp(3) = -( 2.0*x3...
        +p(1)*( c1*x1 )...
        +p(2)*( c2*x2 )...
        +p(3)*( a3 - 2.0*a3*x3/K - b3 + c3*x1^g2 + c4*x2^g1 ));
end

end