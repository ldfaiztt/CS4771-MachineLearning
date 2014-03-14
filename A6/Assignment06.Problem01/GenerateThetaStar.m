function ThetaStar = GenerateThetaStar()
%g(x) = f(x, ThetaStar)

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
ThetaStar = Y;
end

