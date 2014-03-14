function [ColorPlus1, ColorMinus1] = SimMyFlag(N)
%Simulate 2N uniformly drawn points from two colors
Bounds = [0, 1.5; 0, 1];

% Black
a = [0.16, 2/3, -1];
b = [0.16, -2/3, 1];
B = {[a;b]};
ColorMinus1 = SimPolyHedra(N, Bounds, B);
%scatter(ColorMinus1(:,1), ColorMinus1(:,2), 'k.'); hold on;
%dlmwrite('Tanzania_black.txt', pts);

% Yellow
% Yellow 1
a = [0.24, 2/3, -1];
b = [-0.16, -2/3, 1];
Y1 = [a;b];

% Yellow 2
a = [-0.16, 2/3, -1];
b = [0.24, -2/3, 1];
Y2 = [a;b];

Y = {Y1; Y2};
ColorPlus1 = SimPolyHedra(N, Bounds, Y);
%scatter(ColorPlus1(:,1), ColorPlus1(:,2), 'y.'); hold on;
%dlmwrite('Tanzania_yellow.txt', pts);

end