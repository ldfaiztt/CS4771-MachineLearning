function y = SimLogistic(RealThetas, x)
z = 

% calc probability
pr = 1/(1 + exp(-z));


%binary output 
if pr < 0.5
    y = 0;
else
    y = 1;