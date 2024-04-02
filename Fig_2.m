clear all
format long

%% load Graph data
load GraphData_83.mat

%% Degree of each node
G = graph(Connections(:,1),Connections(:,2));
Property = degree(G);

%% Max and min degree
MX = max(Property);
MN = min(Property);

%% Plots

%%% Subplot Fig 2 (left) 
subplot(1,2,1)
nodeedgeplot(Connections,Centers,Property,MX,MN,1)

%%% Subplot Fig 2 (right) 
ah=subplot(1,2,2);
CPOS=get(ah,'Position');
set(ah,'Position',CPOS-[0.05,0,0,0]);
nodeedgeplot(Connections,Centers,Property,MX,MN,2)

pause(0.0001)

%% Save the figure
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 10 6])
% print -dpng Fig_2.png -r500

