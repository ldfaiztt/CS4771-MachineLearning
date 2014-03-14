function [Theta, varargout] = NLK_SVM(x0, x1)
% Linear Kernel Separable SVM
% x0 and x1 matrices of D columns listing the points in the two classes,
% for y_i = +-1 respectively
% Slope D-dimensional direction of max-gap classifier (w)
% Intercept scalar offset (b)

% THIS CODE IS FROM SVM Code by Steve Gunn

% THIS IS FROM MY SOLUTION TO THE PREVIOUS HOMEWORK, which I don't think
% is correct but no solutions were posted and I think it's kind of
% annoying that I will lose points twice for the same mistake, but
% that seems to be the type of class this is.

X = [x0;x1];
y0 = ones(size(x0));
y1 = -ones(size(x1));
Y = [y0;y1];

n = size(X,1);

H = zeros(n,n);
% replace H with K 
for i=1:n
    for j=1:n
        H(i,j) = Y(i)*Y(j)* (X(i,:)*X(j,:)' + 1)^2;
    end
end
c = -ones(n,1);

% Add small amount of zero order regularisation to
% avoid problems when Hessian is badly conditioned.
H = H+1e-10*eye(size(H));

% Set up the parameters for the Optimisation problem

vlb = zeros(n,1);      % Set the bounds: alphas >= 0
vub = 500*ones(n,1);     %                 alphas <= C
x0 = zeros(n,1);       % The starting point is [0 0 0   0]

A = [];, b = [];
% Solve the Optimisation Problem

fprintf('Optimising ...\n');
st = cputime;

%    [alpha lambda how] = quadprog(H, c, A, b, [],[], vlb, vub, x0);
[alpha lambda how] = quadprog(H, c, [],[],A, b, vlb, vub, x0);
w2 = alpha'*H*alpha;
fprintf('|w0|^2    : %f\n',w2);
fprintf('Margin    : %f\n',2/sqrt(w2));

% Compute the number of Support Vectors
[r,c,svs] = find( alpha > 1e-5);
varargout(1) = {alpha(r)};

Theta = [];
for i = 1:DimOfFeatureSpace
    phi_i_of_x = Features(X, i);
    Theta = [Theta; phi_i_of_x];
end
x0 = x0;
x1 = x1;

