function Prices = SimHousingPrices(Market, StdDev, Houses)
Prices=StdDev * randn(size(Houses,1),1)+[Houses  ones( [size(Houses,1) 1])] * Market; 