function y=SimLogistic(RealThetas,x)
y=1./(1+exp(-SimHousingPrices(RealThetas,0,x)) ) > rand([size(x,1) 1]);