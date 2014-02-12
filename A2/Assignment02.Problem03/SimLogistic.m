function y = SimLogistic(RealThetas, x)
% StdDev not defined in problem description, so choose 0
StdDev = 0;

% ensure that input is column vector
RealThetas = RealThetas(:);

% use SimHousingPrices
z = SimHousingPrices(RealThetas, StdDev, x);

% calculate the probability
pr = 1./(1 + exp(-z));

% binary output based on probability
y = pr > 0.5;