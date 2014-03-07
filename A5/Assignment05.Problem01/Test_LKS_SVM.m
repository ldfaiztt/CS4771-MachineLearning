function [Margin, SupportVs, Slope, Intercept, x0, x1] = Test_LKS_SVM(N)
% N number of points to simulate
% scalar Margin distance btw the per-class half-planes (m)
% SupportVs kx2 of k support vectors (usually k=3)

pts = [];

% Tanzania flag
Bounds = [0 1.5;0,1.0];
% black
a = [0.16, 2/3, -1];
b = [0.16, -2/3, 1];
B = {[a;b]};
% cyan
C = {[-0.24, 2/3, -1]};

% generate the x's
x0 = SimPolyHedra(N, Bounds, C);
x1 = SimPolyHedra(N, Bounds, B);

[Slope, Intercept, SupportVs] = LKS_SVM(x0, x1);

Margin = 2/sqrt(Slope);

dlmwrite(strcat('Output_[', int2str(N), ']_x0'), x0);
dlmwrite(strcat('Output_[', int2str(N), ']_x1'), x1);
dlmwrite(strcat('Output_[', int2str(N), ']_Intercept'), Intercept);
dlmwrite(strcat('Output_[', int2str(N), ']_Slope'), Slope);
dlmwrite(strcat('Output_[', int2str(N), ']_SupportVs'), SupportVs);
dlmwrite(strcat('Output_[', int2str(N), ']_Margin'), Margin);
end