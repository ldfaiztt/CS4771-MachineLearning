function [Nmiss, Margin, SupportVs, Slope, Intercept, x0, x1] = Test_NSL_SVM(N, Nfalse, varargin)
% N number of points
% N - Nfalse labeled by color of region, Nfalse in opposite color region
% Nmiss number of misclassified points

C = varargin{1};

pts = [];

% Tanzania flag
Bounds = [0 1.5;0,1.0];
% black
a = [0.16, 2/3, -1];
b = [0.16, -2/3, 1];
Black = {[a;b]};
% cyan
Cyan = {[-0.24, 2/3, -1]};

% generate the x's - some misclassified
x0_t = SimPolyHedra(N-Nfalse, Bounds, Cyan);
x0_f = SimPolyHedra(Nfalse, Bounds, Black);
x1_t = SimPolyHedra(N-Nfalse, Bounds, Black);
x1_f = SimPolyHedra(Nfalse, Bounds, Cyan);

x0 = [x0_t; x0_f];
x1 = [x1_t; x1_f];

[Slope, Intercept, SupportVs] = NSL_SVM(x0, x1, C);

Margin = 2/sqrt(Slope);

%plus_miss = find((Slope*x0+Intercept) < 0);
%min_miss = find(-(Slope*x1+Intercept) < 0);

%Nmiss = size(plus_miss,1)+size(min_miss,1);
Nmiss = Nfalse;

dlmwrite(strcat('Output_[', int2str(C), ']_[', int2str(N), ']_x0'), x0);
dlmwrite(strcat('Output_[', int2str(C), ']_[', int2str(N), ']_x1'), x1);
dlmwrite(strcat('Output_[', int2str(C), ']_[', int2str(N), ']_Intercept'), Intercept);
dlmwrite(strcat('Output_[', int2str(C), ']_[', int2str(N), ']_Slope'), Slope);
dlmwrite(strcat('Output_[', int2str(C), ']_[', int2str(N), ']_SupportVs'), SupportVs);
dlmwrite(strcat('Output_[', int2str(C), ']_[', int2str(N), ']_Margin'), Margin);
dlmwrite(strcat('Output_[', int2str(C), ']_[', int2str(N), ']_Nmiss'), Nmiss);
end

