bnet = MakeChessboardCity();
N=64;
i=8;

evidence = cell(1,N);

% not contaminated
onodes = [5,12,13,14,...
          19,20,21,22,23,...
          27,28,29,30,31,...
          36,37,38,45];
      
for i=1:size(onodes,2)
    evidence{onodes(i)} = 1;
end

engine = jtree_inf_engine(bnet);
[engine, loglik] = enter_evidence(engine, evidence);


% find which depend on a1
a1=1;

% before
for i=1:64
    marg=marginal_nodes(engine,i);
    disp(i);
    disp(marg.T);
end

disp('BREAK');

% change a1
evidence{1} = 2;
[engine, loglik] = enter_evidence(engine, evidence);

for i=1:64
    marg=marginal_nodes(engine,i);
    disp(i);
    disp(marg.T);
end