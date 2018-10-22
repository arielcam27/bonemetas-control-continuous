% close all;
% [Tu1, X1, U1, Tx01, X01] = deno1B(1.e06,1);
% close all;
% [Tu2, X2, U2, Tx02, X02] = deno1B(1.e07,1);
% close all;
% [Tu3, X3, U3, Tx03, X03] = deno1B(1.e08,1);

% figure;
% hold on
% title('Optimal solutions');
% rango = 1:200:size(Tu1,2);
% h1=plot(Tu1(rango),U1(rango),'ko');
% h2=plot(Tu2(rango),U2(rango),'k+');
% h3=plot(Tu3(rango),U3(rango),'ks');
% 
% plot(Tu1,U1,'k');
% plot(Tu2,U2,'k');
% plot(Tu3,U3,'k');
% legend([h1 h2 h3], {'B=1e06', 'B=1e07', 'B=1e08'},'Location','northeast');
% xlabel('Time (days)');
% ylabel('Effectivity');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno11.pdf','-dpdf')
% system(['pdfcrop deno11.pdf deno11.pdf']);

% figure;
% hold on
% title('Cancer cells');
% rango = 1:200:size(Tu1,2);
% h0=plot(Tx01,X01(:,3),'k--');
% h1=plot(Tu1(rango),X1(rango,3),'ko');
% h2=plot(Tu2(rango),X2(rango,3),'k+');
% h3=plot(Tu3(rango),X3(rango,3),'ks');
% 
% plot(Tu1,X1(:,3),'k');
% plot(Tu2,X2(:,3),'k');
% plot(Tu3,X3(:,3),'k');
% legend([h0 h1 h2 h3], {'no control','B=1e06', 'B=1e07', 'B=1e08'},'Location','northwest');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno12.pdf','-dpdf')
% system(['pdfcrop deno12.pdf deno12.pdf']);

% figure;
% hold on
% title('Osteoclasts');
% rango = 1:100:size(Tu1,2);
% h0=plot(Tx01,X01(:,1),'k--');
% h1=plot(Tu1(rango),X1(rango,1),'ko');
% h2=plot(Tu2(rango),X2(rango,1),'k+');
% h3=plot(Tu3(rango),X3(rango,1),'ks');
% 
% plot(Tu1,X1(:,1),'k');
% plot(Tu2,X2(:,1),'k');
% plot(Tu3,X3(:,1),'k');
% legend([h0 h1 h2 h3], {'no control','B=1e06', 'B=1e07', 'B=1e08'},'Location','northeast');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno13.pdf','-dpdf')
% system(['pdfcrop deno13.pdf deno13.pdf']);

% figure;
% hold on
% title('Osteoblasts');
% rango = 1:100:size(Tu1,2);
% h0=plot(Tx01,X01(:,2),'k--');
% h1=plot(Tu1(rango),X1(rango,2),'ko');
% h2=plot(Tu2(rango),X2(rango,2),'k+');
% h3=plot(Tu3(rango),X3(rango,2),'ks');
% 
% plot(Tu1,X1(:,2),'k');
% plot(Tu2,X2(:,2),'k');
% plot(Tu3,X3(:,2),'k');
% legend([h0 h1 h2 h3], {'no control', 'B=1e9', 'B=1e10', 'B=1e11'},'Location','northwest');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno14.pdf','-dpdf')
% system(['pdfcrop deno14.pdf deno14.pdf']);
















% close all;
% [Tu4, X4, U4, Tx02, X02] = deno1B(1.e06,2);
% close all;
% [Tu5, X5, U5, Tx02, X02] = deno1B(1.e07,2);
% close all;
% [Tu6, X6, U6, Tx02, X02] = deno1B(1.e08,2);

% figure;
% hold on
% title('Optimal solutions');
% rango = 1:200:size(Tu4,2);
% h1=plot(Tu4(rango),U4(rango),'ko');
% h2=plot(Tu5(rango),U5(rango),'k+');
% h3=plot(Tu6(rango),U6(rango),'ks');
% 
% plot(Tu4,U4,'k');
% plot(Tu5,U5,'k');
% plot(Tu6,U6,'k');
% legend([h1 h2 h3], {'B=1e06', 'B=1e07', 'B=1e08'},'Location','northeast');
% xlabel('Time (days)');
% ylabel('Effectivity');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno11.pdf','-dpdf')
% system(['pdfcrop deno11.pdf deno11.pdf']);

% figure;
% hold on
% title('Cancer cells');
% rango = 1:200:size(Tu4,2);
% h0=plot(Tx02,X02(:,3),'k--');
% h1=plot(Tu4(rango),X4(rango,3),'ko');
% h2=plot(Tu5(rango),X5(rango,3),'k+');
% h3=plot(Tu6(rango),X6(rango,3),'ks');
% 
% plot(Tu4,X4(:,3),'k');
% plot(Tu5,X5(:,3),'k');
% plot(Tu6,X6(:,3),'k');
% legend([h0 h1 h2 h3], {'no control','B=1e06', 'B=1e07', 'B=1e08'},'Location','southeast');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno12.pdf','-dpdf')
% system(['pdfcrop deno12.pdf deno12.pdf']);

% figure;
% hold on
% title('Osteoclasts');
% rango = 1:100:size(Tu4,2);
% h0=plot(Tx02,X02(:,1),'k--');
% h1=plot(Tu4(rango),X4(rango,1),'ko');
% h2=plot(Tu5(rango),X5(rango,1),'k+');
% h3=plot(Tu6(rango),X6(rango,1),'ks');
% 
% plot(Tu4,X4(:,1),'k');
% plot(Tu5,X5(:,1),'k');
% plot(Tu6,X6(:,1),'k');
% legend([h0 h1 h2 h3], {'no control','B=1e06', 'B=1e07', 'B=1e08'},'Location','northeast');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno13.pdf','-dpdf')
% system(['pdfcrop deno13.pdf deno13.pdf']);

% figure;
% hold on
% title('Osteoblasts');
% rango = 1:100:size(Tu4,2);
% h0=plot(Tx02,X02(:,2),'k--');
% h1=plot(Tu4(rango),X4(rango,2),'ko');
% h2=plot(Tu5(rango),X5(rango,2),'k+');
% h3=plot(Tu6(rango),X6(rango,2),'ks');
% 
% plot(Tu4,X4(:,2),'k');
% plot(Tu5,X5(:,2),'k');
% plot(Tu6,X6(:,2),'k');
% legend([h0 h1 h2 h3], {'no control', 'B=1e06', 'B=1e07', 'B=1e08'},'Location','northwest');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno14.pdf','-dpdf')
% system(['pdfcrop deno14.pdf deno14.pdf']);















% close all;
% [Tu7, X7, U7, Tx03, X03] = deno1B(1.e06,3);
% close all;
% [Tu8, X8, U8, Tx03, X03] = deno1B(1.e07,3);
% close all;
% [Tu9, X9, U9, Tx03, X03] = deno1B(1.e08,3);

% figure;
% hold on
% title('Optimal solutions');
% rango = 1:200:size(Tu7,2);
% h1=plot(Tu7(rango),U7(rango),'ko');
% h2=plot(Tu8(rango),U8(rango),'k+');
% h3=plot(Tu9(rango),U9(rango),'ks');
% 
% plot(Tu7,U7,'k');
% plot(Tu8,U8,'k');
% plot(Tu9,U9,'k');
% legend([h1 h2 h3], {'B=1e06', 'B=1e07', 'B=1e08'},'Location','northeast');
% xlabel('Time (days)');
% ylabel('Effectivity');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno11.pdf','-dpdf')
% system(['pdfcrop deno11.pdf deno11.pdf']);

% figure;
% hold on
% title('Cancer cells');
% rango = 1:200:size(Tu7,2);
% h0=plot(Tx03,X03(:,3),'k--','Linewidth',2);
% h1=plot(Tu7(rango),X7(rango,3),'ko');
% h2=plot(Tu8(rango),X8(rango,3),'k+');
% h3=plot(Tu9(rango),X9(rango,3),'ks');
% 
% plot(Tu7,X7(:,3),'k');
% plot(Tu8,X8(:,3),'k');
% plot(Tu9,X9(:,3),'k');
% legend([h0 h1 h2 h3], {'no control','B=1e06', 'B=1e07', 'B=1e08'},'Location','northwest');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno12.pdf','-dpdf')
% system(['pdfcrop deno12.pdf deno12.pdf']);
% 
% figure;
% hold on
% title('Osteoclasts');
% rango = 1:100:size(Tu7,2);
% h0=plot(Tx03,X03(:,1),'k--','Linewidth',2);
% h1=plot(Tu7(rango),X7(rango,1),'ko');
% h2=plot(Tu8(rango),X8(rango,1),'k+');
% h3=plot(Tu9(rango),X9(rango,1),'ks');
% 
% plot(Tu7,X7(:,1),'k');
% plot(Tu8,X8(:,1),'k');
% plot(Tu9,X9(:,1),'k');
% legend([h0 h1 h2 h3], {'no control', 'B=1e06', 'B=1e07', 'B=1e08'},'Location','northeast');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno13.pdf','-dpdf')
% system(['pdfcrop deno13.pdf deno13.pdf']);
% 
% figure;
% hold on
% title('Osteoblasts');
% rango = 1:100:size(Tu7,2);
% h0=plot(Tx03,X03(:,2),'k--','Linewidth',2);
% h1=plot(Tu7(rango),X7(rango,2),'ko');
% h2=plot(Tu8(rango),X8(rango,2),'k+');
% h3=plot(Tu9(rango),X9(rango,2),'ks');
% 
% plot(Tu7,X7(:,2),'k');
% plot(Tu8,X8(:,2),'k');
% plot(Tu9,X9(:,2),'k');
% legend([h0 h1 h2 h3], {'no control', 'B=1e06', 'B=1e07', 'B=1e08'},'Location','northeast');
% xlabel('Time (days)');
% ylabel('Cell population');
% set(gcf,'units','points','position',[0,0,300,200]);
% set(gcf, 'PaperPositionMode', 'auto')
% set(gca, 'YGrid', 'on');
% print('deno14.pdf','-dpdf')
% system(['pdfcrop deno14.pdf deno14.pdf']);