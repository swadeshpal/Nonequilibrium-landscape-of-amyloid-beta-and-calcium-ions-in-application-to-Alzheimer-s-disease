clear all
format long

%% Parameter set
a1 = 0.25;
a2 = 2.89;
h1 = 1;
k1 = 0.35;
eps = 0.01;
b1 = 0.11;
b2 = 1;
k2 = 5;

%% axis limits
x_st = 0;
x_ed = 6;
y_st = 0;
y_ed = 1.5;

%% Temporal functions
f = @(us,vs) a1+a2*vs^2/(vs^2+h1^2)-k1*us;
g = @(us,vs) (b1+b2*us-k2*vs)/eps;

%% Equilibrium points
P0 = k1*k2;
P1 = -a1*b2-a2*b2-b1*k1;
P2 = h1^2*k1*k2;
P3 = -a1*h1^2*b2-b1*h1^2*k1;
pol=[P0 P1 P2 P3];
rt1=roots(pol);
rt=rt1(imag(rt1)==0);
[M1,nn]=size(rt);
v1=rt;
u1=(k2.*v1-b1)./b2;

%% Unstable manifolds
dt = 0.001;
NI = 100000;

X0(1) = u1(2)+0.000001;
X0(2) = v1(2)+0.000001;
XU1 = sol_deterministic(X0,a1,a2,h1,k1,eps,b1,b2,k2,-dt,NI);

X0(1) = u1(2)-0.000001;
X0(2) = v1(2)-0.000001;
XU2 = sol_deterministic(X0,a1,a2,h1,k1,eps,b1,b2,k2,-dt,NI);

%% Stochastic attractors

%%% No of iterations
NI = 50*NI;

%%% noise xi = 0.01
xi1 = 0.01;
xi2 = 0.01;
dt_s = 0.001;

X0(1) = u1(1)-0.001;
X0(2) = v1(1)-0.001;
XA11 = sol_stochastic(X0,a1,a2,h1,k1,eps,b1,b2,k2,dt_s,NI,xi1,xi2);

X0(1) = u1(3)-0.001;
X0(2) = v1(3)-0.001;
XA12 = sol_stochastic(X0,a1,a2,h1,k1,eps,b1,b2,k2,dt_s,NI,xi1,xi2);

%%% noise xi = 0.05
xi1 = 0.05;
xi2 = 0.05;

X0(1) = u1(1)-0.001;
X0(2) = v1(1)-0.001;
XA21 = sol_stochastic(X0,a1,a2,h1,k1,eps,b1,b2,k2,dt_s,NI,xi1,xi2);

X0(1) = u1(3)-0.001;
X0(2) = v1(3)-0.001;
XA22 = sol_stochastic(X0,a1,a2,h1,k1,eps,b1,b2,k2,dt_s,NI,xi1,xi2);

%%% noise xi = 0.2
xi1 = 0.2;
xi2 = 0.2;

X0(1) = u1(1)-0.001;
X0(2) = v1(1)-0.001;
XA31 = sol_stochastic(X0,a1,a2,h1,k1,eps,b1,b2,k2,dt_s,NI,xi1,xi2);

X0(1) = u1(3)-0.001;
X0(2) = v1(3)-0.001;
XA32 = sol_stochastic(X0,a1,a2,h1,k1,eps,b1,b2,k2,dt_s,NI,xi1,xi2);

%% Plots

%%%% Subplot Fig 1 (left) for the noise xi = 0.01
subplot(1,3,1)
sz = 2;
hold on
box on

%%% Stochastic attractors
plot(XA11(1,:),XA11(2,:),':k','LineWidth',0.1)
plot(XA12(1,:),XA12(2,:),':b','LineWidth',0.1)

%%% Confidential ellipses
F1 = @(x,y) (x - 1.428168395)*(0.508423411950415*x - 0.108105824516643 - 2.00891016067234*y) + (y - 0.3076336791)*(-2.01336035102975*x - 0.214466502482587 + 10.0440372218315*y) - 0.001381551056;
fimplicit(F1,[x_st x_ed y_st y_ed],'MeshDensity',501,'LineStyle','-','Color','r','LineWidth',sz)
G1 = @(x,y) (x - 4.571573999)*(0.487879960811363*x - 0.346902435806544 - 2.01158510777890*y) + (y - 0.9363147999)*(-2.01626454709491*x - 0.199454702778157 + 10.0574692212368*y) - 0.001381551056;
fimplicit(G1,[x_st x_ed y_st y_ed],'MeshDensity',501,'LineStyle','-','Color','m','LineWidth',sz)

%%% Equilibrium points
plot(u1(1),v1(1),'o','MarkerSize',5,'MarkerFaceColor','magenta','MarkerEdgeColor','magenta')
plot(u1(3),v1(3),'o','MarkerSize',5,'MarkerFaceColor','magenta','MarkerEdgeColor','magenta')
plot(u1(2),v1(2),'o','MarkerSize',5,'MarkerFaceColor','red','MarkerEdgeColor','red')

%%% Unstable manifolds
plot(XU1(1,:),XU1(2,:),'--k','LineWidth',1.0)
plot(XU2(1,:),XU2(2,:),'--k','LineWidth',1.0)

%%% axis lebels and limits
xlabel('$$A\beta$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
ylabel('$$Ca^{2+}$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
xlim([x_st x_ed])
ylim([y_st y_ed])

%%% Zoom
axes('Position',[.26 .32 .07 .2])
box on
hold on
plot(XA11(1,:),XA11(2,:),':k','LineWidth',0.1)
fimplicit(G1,[x_st x_ed y_st y_ed],'MeshDensity',501,'LineStyle','-','Color','m','LineWidth',sz)
plot(u1(1),v1(1),'o','MarkerSize',5,'MarkerFaceColor','magenta','MarkerEdgeColor','magenta')
xlim([4.4 4.75])
ylim([0.86 1])

axes('Position',[.1525 .4 .065 .2])
box on
hold on
plot(XA12(1,:),XA12(2,:),':b','LineWidth',0.1)
fimplicit(F1,[x_st x_ed y_st y_ed],'MeshDensity',501,'LineStyle','-','Color','r','LineWidth',sz)
plot(u1(3),v1(3),'o','MarkerSize',5,'MarkerFaceColor','magenta','MarkerEdgeColor','magenta')
xlim([1.26 1.6])
ylim([0.25 0.36])

%%%% Subplot Fig 1 (middle) for the noise xi = 0.05
subplot(1,3,2)

hold on
box on

%%% Stochastic attractors
plot(XA21(1,:),XA21(2,:),':k','LineWidth',0.1)
plot(XA22(1,:),XA22(2,:),':b','LineWidth',0.1)

%%% Confidential ellipses
F2 = @(x,y) (x - 1.428168395)*(0.508423411950415*x - 0.108105824516643 - 2.00891016067234*y) + (y - 0.3076336791)*(-2.01336035102975*x - 0.214466502482587 + 10.0440372218315*y) - 0.03453877640;
fimplicit(F2,[x_st x_ed y_st y_ed],'MeshDensity',501,'LineStyle',':','Color','r','LineWidth',sz)
G2 = @(x,y) (x - 4.571573999)*(0.487879960811363*x - 0.346902435806544 - 2.01158510777890*y) + (y - 0.9363147999)*(-2.01626454709491*x - 0.199454702778157 + 10.0574692212368*y) - 0.03453877640;
fimplicit(G2,[x_st x_ed y_st y_ed],'MeshDensity',501,'LineStyle',':','Color','m','LineWidth',sz)

%%% Equilibrium points
plot(u1(1),v1(1),'o','MarkerSize',5,'MarkerFaceColor','magenta','MarkerEdgeColor','magenta')
plot(u1(3),v1(3),'o','MarkerSize',5,'MarkerFaceColor','magenta','MarkerEdgeColor','magenta')
plot(u1(2),v1(2),'o','MarkerSize',5,'MarkerFaceColor','red','MarkerEdgeColor','red')

%%% Unstable manifolds
plot(XU1(1,:),XU1(2,:),'--k','LineWidth',1.0)
plot(XU2(1,:),XU2(2,:),'--k','LineWidth',1.0)

%%% axis lebels and limits
xlabel('$$A\beta$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
ylabel('$$Ca^{2+}$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
xlim([x_st x_ed])
ylim([y_st y_ed])


%%%% Subplot Fig 1 (right) for the noise xi = 0.2
subplot(1,3,3)
box on
hold on

%%% Stochastic attractors
plot(XA31(1,:),XA31(2,:),':k','LineWidth',0.1)
plot(XA32(1,:),XA32(2,:),':b','LineWidth',0.1)

%%% Confidential ellipses
F3 = @(x,y) (x - 1.428168395)*(0.508423411950415*x - 0.108105824516643 - 2.00891016067234*y) + (y - 0.3076336791)*(-2.01336035102975*x - 0.214466502482587 + 10.0440372218315*y) - 0.5526204224;
fimplicit(F3,[x_st x_ed+1 y_st y_ed],'MeshDensity',501,'LineStyle','--','Color','r','LineWidth',sz)
G3 = @(x,y) (x - 4.571573999)*(0.508423411950415*x - 0.443322935448380 - 2.00891016067234*y) + (y - 0.9363147999)*(-2.01336035102975*x - 0.200154870162240 + 10.0440372218315*y) - 0.5526204224;
fimplicit(G3,[x_st x_ed+1 y_st y_ed],'MeshDensity',501,'LineStyle','--','Color','m','LineWidth',sz)

%%% Equilibrium points
plot(u1(1),v1(1),'o','MarkerSize',5,'MarkerFaceColor','magenta','MarkerEdgeColor','magenta')
plot(u1(3),v1(3),'o','MarkerSize',5,'MarkerFaceColor','magenta','MarkerEdgeColor','magenta')
plot(u1(2),v1(2),'o','MarkerSize',5,'MarkerFaceColor','red','MarkerEdgeColor','red')

%%% Unstable manifolds
plot(XU1(1,:),XU1(2,:),'--k','LineWidth',1.0)
plot(XU2(1,:),XU2(2,:),'--k','LineWidth',1.0)

%%% axis lebels and limits
xlabel('$$A\beta$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
ylabel('$$Ca^{2+}$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
xlim([x_st x_ed+1])
ylim([y_st y_ed])


%% Save the figure
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 13 4])
print -dpng Fig_1.png -r500
