function [Slope, Intercept, varargout] = NSL_SVM(x0,x1,C)
% C controls the weight of slack


% Linear Kernel Non Separable SVM
% x0 and x1 matrices of D columns listing the points in the two classes,
% for y_i = +-1 respectively
% Slope D-dimensional direction of max-gap classifier (w)
% Intercept scalar offset (b)

% THIS CODE IS FROM SVM Code by Steve Gunn
X = [x0;x1];
y0 = ones(size(x0));
y1 = -ones(size(x1));
Y = [y0;y1];

n = size(X,1);
epsilon = C*1e-6;

H = zeros(n,n);
for i=1:n
    for j=1:n
        H(i,j) = Y(i)*Y(j)*X(i,:)*X(j,:)';
    end
end
c = -ones(n,1);

% Add small amount of zero order regularisation to
% avoid problems when Hessian is badly conditioned.
H = H+1e-10*eye(size(H));

% Set up the parameters for the Optimisation problem

vlb = zeros(n,1);      % Set the bounds: alphas >= 0
vub = C*ones(n,1);     %                 alphas <= C
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

Slope=w2;
Intercept=lambda;

end

