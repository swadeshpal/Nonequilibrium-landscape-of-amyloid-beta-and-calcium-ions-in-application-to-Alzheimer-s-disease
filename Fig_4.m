clear all
format long

%% Subplot barrier height
L = 10;
M = 10001;
dx = 2*L/(M-1);

for j=1:M
    X(j) = -L+(j-1)*dx;
    Y(j) = 2*X(j) + (X(j)-1)*(X(j)-3)*(X(j)-4)*(X(j)-8);
end

ah1=subplot(2,3,1:2);
CPOS=get(ah1,'Position');
set(ah1,'Position',CPOS);

plot(X,Y,'-k', 'LineWidth',1.5)
hold on
ylim([-70 50])
xlim([0 8.7])

x1 = 1.67; y1 = -9.8027;
x2 = 3.606; y2 = 9.9461;
x3 = 6.724; y3 = -60.643;
dy = 3.5;
sz = 100;

X23 = linspace(x3-0.1,x3+1.6,M);
Y23 = y3*ones(1,M);

X21 = linspace(x1-1.5,x2-1.8,M);
Y21 = y1*ones(1,M);

X22 = linspace(x1-1.5,x3+1.6,M);
Y22 = y2*ones(1,M);
scatter(x1,y1+0.8*dy,sz,'b square','filled')
scatter(x2,y2+dy,sz,'r o','filled')
scatter(x3,y3+0.8*dy,sz,'b square','filled')
plot(X23,Y23,':k', 'LineWidth',1.5)
plot(X21,Y21,':k', 'LineWidth',1.5)
plot(X22,Y22,':k', 'LineWidth',1.5)

text(x3-0.1,y3+2.5*dy,'$S_{1}$','Interpreter','latex','FontSize',8)
text(x1-0.1,y1+2.5*dy,'$S_{2}$','Interpreter','latex','FontSize',8)
text(x2-0.1,y2+2.8*dy,'$U_{1}$','Interpreter','latex','FontSize',8)

xp1 = [0.15 0.15];
yp1 = [0.792 0.812];
yadj1 = 1.568;   
annotation('textarrow',xp1,yp1,'String','$H_{2}$','Interpreter','latex','FontSize',7,'Linewidth',0.8)
annotation('textarrow',xp1,-yp1+yadj1,'String','','FontSize',7,'Linewidth',0.8)

xp2 = [0.6 0.6];
yp2 = [0.719 0.81];
yadj2 = 1.42;     
annotation('textarrow',xp2,yp2,'String','$H_{1}$','Interpreter','latex','FontSize',7,'Linewidth',0.8)
annotation('textarrow',xp2,-yp2+yadj2,'String','','FontSize',7,'Linewidth',0.8)

box on
ax = gca;
ax.XTick = [];
ax.YTick = [];
title('$\mbox{Barrier~height}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)

%% Subplot the fitting curve at node 3


ah2=subplot(2,3,3);
CPOS=get(ah2,'Position');
set(ah2,'Position',CPOS-[0,0,0,0]);

clear all

%%% The barrier heights for different noise intensities are obtained by using main.m code and the results are saved
%%% in Fig4 directory, which are used here
load('./Fig4/Noise_BH_Node_3.mat')
MSize = 4;
Node = 3;
Ydata = BH(1:62,Node)';
Xdata = Noise(1,1:62);
hl = legend('show');
set(hl, 'Interpreter','latex')
hold on
for j=1:length(Xdata)
    plot(Xdata(j),Ydata(j),'ob','MarkerSize',MSize,'HandleVisibility','off')
end
for j=1:length(Xdata)
    BH_Fit1(j) = 0.0279*Xdata(j)^(-1.107); % 0.0279 and 1.107 are obtained by the Fitting.m code that is in Fig4 directory
end

plot(Xdata(end),Ydata(end),'ob','MarkerSize',MSize,'DisplayName','Data')
plot(Xdata,BH_Fit1,'-m','LineWidth',2,'DisplayName','$H_{1} = 0.0279d^{-1.107}$')
box on
pause(0.0001)
ax = gca;
ax.XTick=[0 0.05 0.1 0.15 0.2];
title('$\mbox{Node 3}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
xlabel('$d$','Interpreter','latex','FontSize',10,'FontWeight','bold','Color','k')
ylabel('$H_{1}$','Interpreter','latex','FontSize',10,'FontWeight','bold','Color','k')

pause(0.0001)

%% Subplot the fitting curve at node 39
ah4=subplot(2,3,4);
CPOS=get(ah4,'Position');
set(ah4,'Position',CPOS+[0,0.04,0,0]);
clear all

load('./Fig4/Noise_BH_Node_39.mat')
MSize = 4;
Node = 39;
Ydata = BH(1:end,Node)';
Xdata = Noise(1,1:end);
hl = legend('show');
set(hl, 'Interpreter','latex')
hold on
for j=1:length(Xdata)
    plot(Xdata(j),Ydata(j),'ob','MarkerSize',MSize,'HandleVisibility','off')
end
for j=1:length(Xdata)
    BH_Fit1(j) = 0.3675*Xdata(j)^(-1.0219); % 0.3675 and 1.0219 are obtained by the Fitting.m code that is in Fig4 directory
end

plot(Xdata(end),Ydata(end),'ob','MarkerSize',MSize,'DisplayName','Data')
plot(Xdata,BH_Fit1,'-m','LineWidth',2,'DisplayName','$H_{1} = 0.03675d^{-1.0219}$')
box on
pause(0.0001)
ax = gca;
ax.XTick=[0 0.05 0.1 0.15 0.2];
title('$\mbox{Node 39}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
xlabel('$d$','Interpreter','latex','FontSize',10,'FontWeight','bold','Color','k')
ylabel('$H_{1}$','Interpreter','latex','FontSize',10,'FontWeight','bold','Color','k')

pause(0.0001)

%% Subplot the fitting curve at node 4
ah5=subplot(2,3,5);
CPOS=get(ah5,'Position');
set(ah5,'Position',CPOS+[0,0.04,0,0]);
clear all
load('./Fig4/Noise_BH_Node_4.mat')
MSize = 4;
Node = 4;
Ydata = BH(2:end,Node)';
Xdata = Noise(1,2:end);
hl = legend('show');
set(hl, 'Interpreter','latex')
hold on
for j=1:length(Xdata)
    plot(Xdata(j),Ydata(j),'ob','MarkerSize',MSize,'HandleVisibility','off')
end
for j=1:length(Xdata)
    BH_Fit1(j) = 1.497*Xdata(j)^(-0.9999);  % 1.497 and 0.9999 are obtained by the Fitting.m code that is in Fig4 directory
end

plot(Xdata(end),Ydata(end),'ob','MarkerSize',MSize,'DisplayName','Data')
plot(Xdata,BH_Fit1,'-m','LineWidth',2,'DisplayName','$H_{1} = 1.497d^{-0.9999}$')
box on
pause(0.0001)
ax = gca;
ax.XTick=[0 0.05 0.1 0.15 0.2];
title('$\mbox{Node 4}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
xlabel('$d$','Interpreter','latex','FontSize',10,'FontWeight','bold','Color','k')
ylabel('$H_{1}$','Interpreter','latex','FontSize',10,'FontWeight','bold','Color','k')

pause(0.0001)

%% Subplot the fitting curve at node 36
ah6=subplot(2,3,6);
CPOS=get(ah6,'Position');
set(ah6,'Position',CPOS+[0,0.04,0,0]);
clear all
load('./Fig4/Noise_BH_Node_36.mat')
MSize = 4;
Node = 36;
Ydata = BH(5:end,Node)';
Xdata = Noise(1,5:end);
hl = legend('show');
set(hl, 'Interpreter','latex')
hold on
for j=1:length(Xdata)
    plot(Xdata(j),Ydata(j),'ob','MarkerSize',MSize,'HandleVisibility','off')
end
for j=1:length(Xdata)
    BH_Fit1(j) = 4.6801*Xdata(j)^(-0.9732); % 4.6801 and 0.9732 are obtained by the Fitting.m code that is in Fig4 directory
end

plot(Xdata(end),Ydata(end),'ob','MarkerSize',MSize,'DisplayName','Data')
plot(Xdata,BH_Fit1,'-m','LineWidth',2,'DisplayName','$H_{1} = 4.6801d^{-0.9732}$')
box on
pause(0.0001)
ax = gca;
ax.XTick=[0 0.05 0.1 0.15 0.2];
title('$\mbox{Node 36}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
xlabel('$d$','Interpreter','latex','FontSize',10,'FontWeight','bold','Color','k')
ylabel('$H_{1}$','Interpreter','latex','FontSize',10,'FontWeight','bold','Color','k')

pause(0.0001)

%% Save the figure
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 7])
print -dpng Fig4.png -r500