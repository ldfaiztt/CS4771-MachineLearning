function [ marginal ] = GetMarginalsGiven1(node)
%A11: Problem 2
%GetMarginalsGiven1
% compute marginal probabilities for ChessBoardCity sensors
% input:
% node number to marginalize over (integers in 1..64)
% output:
% marginal: an 8x2 matrix of real values, the i-th column of which
% has the marginal probabilities of respective blocks
% a1,e1,h1,a4,h5,a8,d8,h8 to be contaminated, given that node is observed
% to be i

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

for s=1:size(obs_nodes,2)
    evidence{obs_nodes(s)} = 1;
end

% return info on sensor nodes
sensor_nodes = [1,33,57,4,61,8,32,64];
s_num = size(sensor_nodes, 2);
marginal = zeros(s_num, 2);

% both columns
for i=1:2
    % add evidence that node is observed to be i
    evidence{node} = i;
    
    % use JTA (exact inference)
    engine = jtree_inf_engine(bnet);
    [engine, ~] = enter_evidence(engine, evidence);  

    % get the marginal probabilities of the sensors
    for s=1:s_num
        % if node is a sensor, probabilities 0 or 1
        if node == sensor_nodes(s)
            p = i - 1;
        else
            m = marginal_nodes(engine, sensor_nodes(s));
            p = m.T(2);
        end
        marginal(s,i) = p;
    end
    
end

end

