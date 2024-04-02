%%%% This is the landscape plot in the network for d = 0.001
clear all
format long

%%%% The landscape data is obtained by main.m code for the noise d = 0.001
load('Data_Network_Noise_0_001.mat')


%%% calculate the landscape
y_max = [7.5, 1.5]; %% Range of the landscape
y_min = [0, 0];

%% Subplot Fig 3 (upper panel) for the node 3
ah1=subplot(2,4,1);
CPOS=get(ah1,'Position');
set(ah1,'Position',CPOS);
for node = 3:3
    s1p = node;
    s2p = node+N_node;
    
    mu_pca = zeros(nAttractor, 2);
    sig_pca = cell(nAttractor, 1);
    for k = 1 : nAttractor
        mu_pca(k, 1) = mu(k, s1p);
        mu_pca(k, 2) = mu(k, s2p);
        sig_pca{k} = sig{k};
    end
    g = 751;
    step = (y_max - y_min) / (g - 1); %% Length of the step
    [xp, yp] = meshgrid(y_min(1) : step(1) : y_max(1), y_min(2) : step(2) : y_max(2)); %% Grid
    P_ss = zeros(g);
    for k = 1 : size(mu_pca, 1)
        Sigma = [sig_pca{k}(s1p,s1p), sig_pca{k}(s1p,s2p); sig_pca{k}(s2p,s1p), sig_pca{k}(s2p,s2p)];
        DetSig = det(Sigma);
        InvSig = inv(Sigma);
        for m = 1 : g
            for n = 1 : g
                P_ss(m, n) =  P_ss(m, n) + weight(k) * normal_distribution([xp(m, n); yp(m, n)], mu_pca(k, :)', DetSig, InvSig);
            end
        end
    end
    P_ss = P_ss / sum(sum(P_ss)); % normalization
    U = -log(P_ss);
    U(U > 100)  = 100;
end
Landscape_plot(U,xp,yp,3)

title('$\mbox{Node 3}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
pause(0.0001)

%% Subplot Fig 3 (upper panel) for the node 39
ah2=subplot(2,4,2);
CPOS=get(ah2,'Position');
set(ah2,'Position',CPOS-[0.00,0,0,0]);
for node = 39:39
    s1p = node;
    s2p = node+N_node;
    
    mu_pca = zeros(nAttractor, 2);
    sig_pca = cell(nAttractor, 1);
    for k = 1 : nAttractor
        mu_pca(k, 1) = mu(k, s1p);
        mu_pca(k, 2) = mu(k, s2p);
        sig_pca{k} = sig{k};
    end
    g = 751;
    step = (y_max - y_min) / (g - 1); %% Length of the step
    [xp, yp] = meshgrid(y_min(1) : step(1) : y_max(1), y_min(2) : step(2) : y_max(2)); %% Grid
    P_ss = zeros(g);
    for k = 1 : size(mu_pca, 1)
        Sigma = [sig_pca{k}(s1p,s1p), sig_pca{k}(s1p,s2p); sig_pca{k}(s2p,s1p), sig_pca{k}(s2p,s2p)];
        DetSig = det(Sigma);
        InvSig = inv(Sigma);
        for m = 1 : g
            for n = 1 : g
                P_ss(m, n) =  P_ss(m, n) + weight(k) * normal_distribution([xp(m, n); yp(m, n)], mu_pca(k, :)', DetSig, InvSig);
            end
        end
    end
    P_ss = P_ss / sum(sum(P_ss)); % normalization
    U = -log(P_ss);
    U(U > 100)  = 100;
end
Landscape_plot(U,xp,yp,39)
title('$\mbox{Node 39}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
pause(0.0001)

%% Subplot Fig 3 (upper panel) for the node 4
ah3=subplot(2,4,3);
CPOS=get(ah3,'Position');
set(ah3,'Position',CPOS-[0.00,0,0,0]);
for node = 4:4
    s1p = node;
    s2p = node+N_node;
    
    mu_pca = zeros(nAttractor, 2);
    sig_pca = cell(nAttractor, 1);
    for k = 1 : nAttractor
        mu_pca(k, 1) = mu(k, s1p);
        mu_pca(k, 2) = mu(k, s2p);
        sig_pca{k} = sig{k};
    end
    g = 751;
    step = (y_max - y_min) / (g - 1); %% Length of the step
    [xp, yp] = meshgrid(y_min(1) : step(1) : y_max(1), y_min(2) : step(2) : y_max(2)); %% Grid
    P_ss = zeros(g);
    for k = 1 : size(mu_pca, 1)
        Sigma = [sig_pca{k}(s1p,s1p), sig_pca{k}(s1p,s2p); sig_pca{k}(s2p,s1p), sig_pca{k}(s2p,s2p)];
        DetSig = det(Sigma);
        InvSig = inv(Sigma);
        for m = 1 : g
            for n = 1 : g
                P_ss(m, n) =  P_ss(m, n) + weight(k) * normal_distribution([xp(m, n); yp(m, n)], mu_pca(k, :)', DetSig, InvSig);
            end
        end
    end
    P_ss = P_ss / sum(sum(P_ss)); % normalization
    U = -log(P_ss);
    U(U > 100)  = 100;
end
Landscape_plot(U,xp,yp,4)
title('$\mbox{Node 4}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
pause(0.0001)

%% Subplot Fig 3 (upper panel) for the node 36
ah4=subplot(2,4,4);
CPOS=get(ah4,'Position');
set(ah4,'Position',CPOS-[0.0,0,0,0]);
for node = 36:36
    s1p = node;
    s2p = node+N_node;
    
    mu_pca = zeros(nAttractor, 2);
    sig_pca = cell(nAttractor, 1);
    for k = 1 : nAttractor
        mu_pca(k, 1) = mu(k, s1p);
        mu_pca(k, 2) = mu(k, s2p);
        sig_pca{k} = sig{k};
    end
    g = 751;
    step = (y_max - y_min) / (g - 1); %% Length of the step
    [xp, yp] = meshgrid(y_min(1) : step(1) : y_max(1), y_min(2) : step(2) : y_max(2)); %% Grid
    P_ss = zeros(g);
    for k = 1 : size(mu_pca, 1)
        Sigma = [sig_pca{k}(s1p,s1p), sig_pca{k}(s1p,s2p); sig_pca{k}(s2p,s1p), sig_pca{k}(s2p,s2p)];
        DetSig = det(Sigma);
        InvSig = inv(Sigma);
        for m = 1 : g
            for n = 1 : g
                P_ss(m, n) =  P_ss(m, n) + weight(k) * normal_distribution([xp(m, n); yp(m, n)], mu_pca(k, :)', DetSig, InvSig);
            end
        end
    end
    P_ss = P_ss / sum(sum(P_ss)); % normalization
    U = -log(P_ss);
    U(U > 100)  = 100;
end
Landscape_plot(U,xp,yp,36)
title('$\mbox{Node 36}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
pause(0.0001)

%% Subplot Fig 3 (lower panel) for the node 3
ah5=subplot(2,4,5);
CPOS=get(ah5,'Position');
set(ah5,'Position',CPOS-[0.0,0.02,0,0]);

clear all
load('./Fig3/Node3.mat')
surf(xp,yp,U); colormap("jet");  shading interp; axis tight
view(-15,63)
for k = 1 : size(mu_pca, 1)
    hold on
    scatter3(mu_pca(k, 1), mu_pca(k, 2), U_min(k)+2, 20, 's', 'filled', 'MarkerEdgeColor', "red", 'MarkerFaceColor', "red")
end
scatter3(2.908, 0.604, U_min(1)+2, 20, 'o', 'filled', 'MarkerEdgeColor', "magenta", 'MarkerFaceColor', "magenta")
xlabel('$A\beta$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
ylabel('$Ca^{2+}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
zlabel('$U$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
title('$\mbox{Node~3}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)

%% Subplot Fig 3 (lower panel) for the node 39
ah6=subplot(2,4,6);
CPOS=get(ah6,'Position');
set(ah6,'Position',CPOS-[0.0,0.02,0,0]);
clear all
load('./Fig3/Node39.mat')
surf(xp,yp,U); colormap("jet");  shading interp; axis tight

for k = 1 : size(mu_pca, 1)
    hold on
    scatter3(mu_pca(k, 1), mu_pca(k, 2), U_min(k)+2, 20, 's', 'filled', 'MarkerEdgeColor', "red", 'MarkerFaceColor', "red")
end

% Plot the saddle point
for k = 1 : size(saddle_point, 1)
    hold on
    scatter3(saddle_point(k, 1), saddle_point(k, 2), U_saddle(k)+1, 20, 'o', 'filled', 'MarkerEdgeColor', "magenta", 'MarkerFaceColor', "magenta")
end

view(-22,50)
xlabel('$A\beta$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
ylabel('$Ca^{2+}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
zlabel('$U$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
title('$\mbox{Node~39}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)

%% Subplot Fig 3 (lower panel) for the node 4
ah7=subplot(2,4,7);
CPOS=get(ah7,'Position');
set(ah7,'Position',CPOS-[0.0,0.02,0,0]);
clear all
load('./Fig3/Node4.mat')
surf(xp,yp,U); colormap("jet");   shading interp; axis tight

for k = 1 : size(mu_pca, 1)
    hold on
    scatter3(mu_pca(k, 1), mu_pca(k, 2), U_min(k)+2, 20, 's', 'filled', 'MarkerEdgeColor', "red", 'MarkerFaceColor', "red")
end

% Plot the saddle point
for k = 1 : size(saddle_point, 1)
    hold on
    scatter3(saddle_point(k, 1), saddle_point(k, 2), U_saddle(k)+1, 20, 'o', 'filled', 'MarkerEdgeColor', "magenta", 'MarkerFaceColor', "magenta")
end
view(-24,57)
xlabel('$A\beta$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
ylabel('$Ca^{2+}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
zlabel('$U$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
title('$\mbox{Node~4}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)

%% Subplot Fig 3 (lower panel) for the node 36
ah8=subplot(2,4,8);
CPOS=get(ah8,'Position');
set(ah8,'Position',CPOS-[0.0,0.02,0,0]);
clear all
load('./Fig3/Node36.mat')
surf(xp,yp,U); colormap("jet");   shading interp; axis tight

for k = 1 : size(mu_pca, 1)
    hold on
    scatter3(mu_pca(k, 1), mu_pca(k, 2), U_min(k)+2, 20, 's', 'filled', 'MarkerEdgeColor', "red", 'MarkerFaceColor', "red")
end

% Plot the saddle point
for k = 1 : size(saddle_point, 1)
    hold on
    scatter3(saddle_point(k, 1), saddle_point(k, 2), U_saddle(k)+1, 20, 'o', 'filled', 'MarkerEdgeColor', "magenta", 'MarkerFaceColor', "magenta")
end
view(-31,80)
xlabel('$A\beta$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
ylabel('$Ca^{2+}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
zlabel('$U$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)
title('$\mbox{Node~36}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 8)

%% Save the figure
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 7 5])
% print -dpng Fig3.png -r500