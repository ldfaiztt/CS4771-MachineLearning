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

% ensure column vectors
lambdas = lambdas(:);
proportions = proportions(:);

% count number to simulate of each lambda
lam_counts = zeros(size(lambdas));
% simulate N values
for i = 1:N
    % find which distribution based on proportions
    lam_index = find(rand() <= cumsum(proportions),1);
    lam_counts(lam_index) = lam_counts(lam_index) + 1;
end;

% create the empty output vector
mix_of_exps = [];
for i = 1:size(lam_counts,1)
    % sample this distribution with this lambda
    lambda = lambdas(i);
    pd = makedist('Exponential','mu',1/lambda);
    mix_of_exps = [mix_of_exps; random(pd, lam_counts(i),1)];
end;