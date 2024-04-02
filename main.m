clear all; 
format long

%%%%% Load the parameter values and the solution
load('parameters.mat')
load('solution.mat')

%%%%% Brain connectome data
load('GraphData_83.mat')
ADJ = L;
N_node = length(ADJ(1,:));
for n=1:N_node
    Soln(:,n) = X(:,1);
    Soln(:,n+N_node) = X(:,2);
end
rhou = 1;
rhov = 1;
clear X L;

%%%%% determine the unique attractors
var = Soln;
[uni_var, ~, IC] = uniquetol(var, 0.1, 'ByRows', true);
weight = hist(IC, unique(IC))/ size(var, 1);
[weight, I] = sort(weight, 'descend');
uni_var = uni_var(I, :);
mu = uni_var;
nAttractor = length(weight);
clear Soln var IC;

%%% nsigma is the noise intensity d
nsigma = 0.001;
sig = cell(1, nAttractor);

%%%%% variance matrix at steady state
B = -2 * diag([repmat(nsigma, 1, N_node), repmat(nsigma/epsilon, 1, N_node)]);

for k = 1 : nAttractor
    Jacob_F = Jacobian_M(a2,alpha,k1,epsilon,b2,k2,rhou,rhov,ADJ,mu(k,:)');
    sig{1, k} = calculateVariance(Jacob_F, B);
    if find(diag(sig{k}) < 0)
        error('The variance is negative!')
    end
end

save('Data_Network_Noise_0_001.mat')
