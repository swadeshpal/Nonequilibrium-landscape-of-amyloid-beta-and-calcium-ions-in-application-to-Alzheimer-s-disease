clear all
format long

%% load the data at node 3
load('Noise_BH_Node_3.mat')

Node = 3;
Ydata = BH(1:62,Node)';
Xdata = Noise(1,1:62);

%% Power-law fit function
Fun = @(par,X) par(1)*X.^(par(2));

%% Initial parameter values for the fitting
Ini_par = [1,1];

%% Estimated parameter values by least square curve fit
PAR = lsqcurvefit(Fun, Ini_par, Xdata, Ydata);

%% Plot the points and the curve
hold on
for j=1:length(Xdata)
    YFit(j) = Fun(PAR,Xdata(j));
    plot(Xdata(j),Ydata(j),'ob')
end
plot(Xdata,YFit,'-r')

SStot = sum((Ydata-mean(Ydata)).^2);                            % Total Sum-Of-Squares
SSres = sum((Ydata(:)-YFit(:)).^2);                         % Residual Sum-Of-Squares
Rsq = 1-SSres/SStot;  

