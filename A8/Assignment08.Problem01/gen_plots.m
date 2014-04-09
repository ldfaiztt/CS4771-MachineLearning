% HW8-Q1: Script to generate plots

load('Data.mat');
% X (Nx9), y_int (Nx1), y_real (Nx1)

% Two classes of datapoints: X1 and X2
X1 = X(y_int==1,:);
X2 = X(y_int==2,:);

% subtract the means
% (Nx9), (N1x9), (N2x9) where N=N1+N2
X_cen = bsxfun(@minus, X, mean(X));
X1_cen = bsxfun(@minus, X1, mean(X1));
X2_cen = bsxfun(@minus, X2, mean(X2));

% calculate the 3 eigenvectors/eigenvalues of the covariance matrix
% (9x3) evector matrics
% diagonal (3x3) eigenvalue matrices (descending order)
[X_evec,  X_e]  = eigs(cov(X_cen), 3, 'lm');
[X1_evec, X1_e] = eigs(cov(X1_cen), 3, 'lm');
[X2_evec, X2_e] = eigs(cov(X2_cen), 3, 'lm');

% compute coefficients - projection
% (Nx3) matrix
X_c = X_cen * X_evec; 
X1_c = X_cen * X1_evec;
X2_c = X_cen * X2_evec;

% three 3D scatter plots of all N points, color coded by class (1 or 2)
% Plot one - principal components of X
red = X_c(y_int==1, :);
blue = X_c(y_int==2,:);
scatter3(red(:,1), red(:,2), red(:,3), 'r.'); hold on;
scatter3(blue(:,1), blue(:,2), blue(:,3), 'b.');
%saved as scatterX.fig

% Plot two - principal components of X1
red = X1_c(y_int==1, :);
blue = X1_c(y_int==2,:);
scatter3(red(:,1), red(:,2), red(:,3), 'r.'); hold on;
scatter3(blue(:,1), blue(:,2), blue(:,3), 'b.');
%saved as scatterX1.fig

% Plot three - principal components of X2
red = X2_c(y_int==1, :);
blue = X2_c(y_int==2,:);
scatter3(red(:,1), red(:,2), red(:,3), 'r.'); hold on;
scatter3(blue(:,1), blue(:,2), blue(:,3), 'b.');
%saved as scatterX2.fig
