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



