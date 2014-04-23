function ChessboardCity = MakeChessboardCity()
%A10, Problem2: implements the Bayes Net
%   returns a bnet object
i = 8;
N = i*i;
dag = zeros(N,N);

% example:
% a=0;b=1;c=2;d=3;e=4;f=5;g=6;h=7;
% a1 -> a2, b1, b2
% dag(a*i+1,a*i+2) = 1;
% dag(a*i+1,b*i+2) = 1;
% dag(a*i+1,b*i+1) = 1;

% create the relationships of bnet
for j=1:8
    for letter=0:7
        % connect S to N
        if j ~= 8
            dag(letter*i+j, letter*i+j+1) = 1;
        end
        % connect W to E
        if letter ~= 7
            dag(letter*i+j, (letter+1)*i+j) = 1;
        end
        % connect diagonally
        if letter ~= 7 && j ~= 8
            dag(letter*i+j, (letter+1)*i+j+1) = 1;
        end       
    end
end

% only two options for each variable
node_sizes = 2*ones(1,N); 

% name each node
names_list = {'a1','a2','a3','a4','a5','a6','a7','a8', ...
              'b1','b2','b3','b4','b5','b6','b7','b8', ...
              'c1','c2','c3','c4','c5','c6','c7','c8', ...
              'd1','d2','d3','d4','d5','d6','d7','d8', ...
              'e1','e2','e3','e4','e5','e6','e7','e8', ...
              'f1','f2','f3','f4','f5','f6','f7','f8', ...
              'g1','g2','g3','g4','g5','g6','g7','g8', ...
              'h1','h2','h3','h4','h5','h6','h7','h8'};

bnet = mk_bnet(dag, node_sizes, 'names', names_list);

% fill in probabilities:

% t1: first corner
t1 = [0.95 0.05];
a1 = bnet.names('a1');
bnet.CPD{a1} = tabular_CPD(bnet, a1, t1);

% t2 probs: along the S/W edges of town
t2 = [0.95 0.65 0.05 0.35];
for letter=0:7
	if letter == 0
        for j=2:8
            bnet.CPD{j} = tabular_CPD(bnet, j, t2);
        end
    else
        bnet.CPD{letter*i+1} = tabular_CPD(bnet, letter*i+1, t2);
	end
end

% t3 probs: the rest
t3 = [0.95 0.65 0.65 0.65 0.35 0.35 0.35 0.05 ...
      0.05 0.35 0.35 0.35 0.65 0.65 0.65 0.95];
for letter=1:7
    for j=2:8
        bnet.CPD{letter*i+j} = tabular_CPD(bnet, letter*i+j, t3);
    end
end

ChessboardCity = bnet;
end

