function [ marginal ] = GetMarginals()
%A11: Problem 1
%GetMarginals
% compute marginal probabilities for ChessBoardCity sensors
% returns a vector of 8 real values that have the marginal probabilities
% of respective blocks a1,e1,h1,a4,h5,a8,d8,h8 to be contaminated

% uses posted solution
bnet = MakeChessboardCity();
N=64;

% evidence is that city hall, city hall neighborhood, and the adjacent
% blocks (18 blocks total) are observed to uncontaminated

% not contaminated (observed) indices
obs_nodes = [5,12,13,14,...
             19,20,21,22,23,...
             27,28,29,30,31,...
             36,37,38,45];

evidence = cell(1,N);

for i=1:size(obs_nodes,2)
    evidence{obs_nodes(i)} = 1;
end

% use JTA (exact inference)
engine = jtree_inf_engine(bnet);
[engine, ~] = enter_evidence(engine, evidence);  

% get the marginal probabilities of your sensors
sensor_nodes = [1,33,57,4,61,8,32,64];
s_num = size(sensor_nodes,2);
marginal = zeros(s_num,1);

for i=1:s_num
    m = marginal_nodes(engine, sensor_nodes(i));
    p = m.T(2);
    marginal(i) = p;
end

end

