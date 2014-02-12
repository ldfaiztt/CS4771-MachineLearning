function y = SimPoly(RealThetas, StdDev, x)
% ensure that inputs are column vectors
RealThetas = RealThetas(:);
x = x(:);

% % THE WAY I WOULD DO IT ORIGINALLY
% % calculate a column vector of normally-distributed random variables%
% e = normrnd(0, StdDev, size(x));
% % evaluate polynomial with RealThetas coefficients
% sanity_check = polyval(RealThetas, x) + e

% create usable form of x matrix like: 
% 
% x1^3 x1^2 x1
% x2^3 x2^2 x2
% x3^3 x3^2 x3

for i = 1:size(RealThetas, 1) - 1
    if i == 1
        xnew = [x.^i];
    else
        xnew = [x.^i xnew];
    end;
end;

% then housing will add the 1's column, multiply by the poly coeffs,
% and add in the randomness
y = SimHousingPrices(RealThetas, StdDev, xnew);