function SimTanzania()
N = 50;
D = 2;
Bounds = [0, 1.5; 0, 1];

%Green
G = {[-0.24, -2/3, 1]};
pts = SimPolyHedra(N, Bounds, G);
scatter(pts(:,1), pts(:,2), 'g.'); hold on;
dlmwrite('Tanzania_green.txt', pts);

% Black
a = [0.16, 2/3, -1];
b = [0.16, -2/3, 1];
B = {[a;b]};
pts = SimPolyHedra(N, Bounds, B);
scatter(pts(:,1), pts(:,2), 'k.'); hold on;
dlmwrite('Tanzania_black.txt', pts);

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
pts = SimPolyHedra(N, Bounds, Y);
scatter(pts(:,1), pts(:,2), 'y.'); hold on;
dlmwrite('Tanzania_yellow.txt', pts);

% Cyan
C = {[-0.24, 2/3, -1]};
pts = SimPolyHedra(N, Bounds, C);
scatter(pts(:,1), pts(:,2), 'c.'); hold on;
dlmwrite('Tanzania_cyan.txt', pts);

