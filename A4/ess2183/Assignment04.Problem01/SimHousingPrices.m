function Prices = SimHousingPrices(Market, StdDev, Houses)
Prices=StdDev * randn(size(Houses,1),1)+[ones([size(Houses,1) 1]) Houses] * Market; 