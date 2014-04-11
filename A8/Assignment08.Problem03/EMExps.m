function [ lambdas, proportions, components, responsibilities] = EMExps( data, K )
%% EMExps learn a mixture of K exponential random variables
%% Input:
% data - a real column vector of N entries
% K - the assumed integer number of exponentially distributed random
% variables in the data
%% Output:
% lambdas - a real row vector with K lambda parameters inferred respectively for the exponential
% distributions in the mixture
% proportions - a real row vector with K probabilities that sum to one, that
% are the inferred priors for a datapoint's cluster membership
% components - an N x K matrix whose i,j entry is the probability
% of seeing a value data(i) being drawn from the j-th inferred exponential
% responsibilities - an N x K matrix whose i,j entry is the inferred posterior probability
% of the j-th exponential being responsible to data(i) 
%%
N = size(data, 1);
components = zeros(N, K);
responsibilities = zeros(N,K);

% initialize (randomly) lambdas and proportions
lambdas = rand(1,K);
proportions = rand(1,K);
proportions = proportions / sum(proportions); % must sum to 1

% check for little change
diff = 1000;

while diff > 10
    % E step
    t=0;
    for j=1:K
        t_j = sum (proportions(j) * lambdas(j) * exp(-lambdas(j) * data));
        t=t+t_j;
    end
    for k=1:K
        lam = lambdas(k);
        components(:,k) = proportions(k)*lam*exp(-lam*data) / t;
    end;

    % M step
    % z=zeros(N,K);
    % for i=1:K
    %     z = z + components(:,i)*data(:);
    % end
    
    c = zeros(1,K);
    for i=1:N
        c = c + components(i,:) .* data(i);
    end
    
    new_lambdas = sum(components,1) ./ c;
    
    
    new_proportions = proportions;
    %lambda   sum {i=1:N} gamma(z_i) / sum {i=1:N} gamma(z_i)*x_i
    
    %components(i) / N
    

    % update diff to check for change
    diff = lambdas-new_lambdas;
    lambdas=new_lambdas;
end;

