function [ mix_of_exps ] = SimMixExps( lambdas, proportions, N)
%%SimMixExps Simulate a mixture of exponential random variables
%% Input:
% lambdas - an array of K lambda arguments, specifying the parameter for
% each of respective K exponential distributions
% proportions - an array of K probilities that sum to 1, specifying the
% chance of each number to be
% generated from each of the respective K exponential distrbutions
% N - a scalar 
%% Output:
% mix_of_exps - a vector containing N values from the aforementioned mixture
% 
