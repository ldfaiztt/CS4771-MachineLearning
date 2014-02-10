%Emily Schultz (ess2183)
function Prices = SimHousingPrices(Market, StdDev, Houses)

% add a column of ones to the Houses matrix to include the fixed-cost
ones_col = ones(size(Houses, 1), 1);
Houses_New = [Houses ones_col];

% linear combination of Houses and Market plus the fixed-cost
P = Houses_New*Market;

% plus simulated value of a normally-distributed random variable
Prices = P + normrnd(0, StdDev, size(P));