function y = SimPoly(RealThetas, StdDev, x)
% ensure that inputs are column vectors
RealThetas = RealThetas(:);
x = x(:);

% create usable form of x matrix like: 
%   x1^3 x1^2 x1
%   x2^3 x2^2 x2
%   x3^3 x3^2 x3

for i = 1:size(RealThetas, 1) - 1
    if i == 1
        x_new = [x.^i];
    else
        x_new = [x.^i x_new];
    end;
end;

% then SimHousingPrices will add the 1's column,
% multiply by the polynomial coefficients of RealThetas,
% and add in the necessary randomness using StdDev
y = SimHousingPrices(RealThetas, StdDev, x_new);