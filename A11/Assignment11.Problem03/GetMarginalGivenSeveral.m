function [ marginal ] = GetMarginalGivenSeveral(nodes)
%A11:Problem3
%GetMarginalGivenSeveral
% compute marginal probabilities for Chessboard City sensors
% Input: the set of nodes n1,n2,...,nk
% to be marginalized over (a vector of integers, all in 1..64)
% returns a 8x2x2..x2 matrix of real values, 
% the (i1,i2,...,ik)-th column of which has the marginal probabilities
% of respective blocks a1,e1,h1,a4,h5,a8,d8,h8 to be contaminated
% given that node n1 is observed to be i1, node n2 to be i2,...,
% node nk to be ik

% uses posted solution
bnet = MakeChessboardCity();
N=64;
nodes = nodes(:);

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
n_num = size(nodes, 1);

% build an empty 8x2x2x..x2 matrix
v=[s_num repmat(2,[1 n_num])];
marginal = repmat(0, v);
nod_ind = cell(1, ndims(marginal));

% for each observed node combination
for n=1:8:numel(marginal)
    % get the values for nodes here
    [nod_ind{:}] = ind2sub(size(marginal),n);

    % set the observed
    for j=2:size(nod_ind,2)
        node = nodes(j-1);
        evidence{node} = nod_ind{j};
    end

    % use JTA (exact inference)
    engine = jtree_inf_engine(bnet);
    [engine, ~] = enter_evidence(engine, evidence); 
    
    % get the marginal probabilities of the sensor
    for s=1:s_num
        % if node is a sensor, probabilities 0 or 1
        if find(sensor_nodes(s)==nodes)
            p = nod_ind{find(sensor_nodes(s)==nodes)+1} - 1;
        else
            m = marginal_nodes(engine, sensor_nodes(s));
            p = m.T(2);
        end
        marginal(n+s-1) = p;
    end
end

end

