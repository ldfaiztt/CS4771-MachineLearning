% Part 1b: test GradDescentLogistic
% i) Set StopTime to 60
StopTime = 6;

% ii) Choose N=100 x values in D=8 dimensions randomly and uniformly
% within the range (-5,5)^D
N = 100;
D = 8;

% using M=20 test datapoints generated the same way
M = 20;

% range
a = -5;
b = 5;
x_train = (b-a) .* rand(N,D) + a;
x_test  = (b-a) .* rand(M,D) + a;

% iii) Use SimLogistic with sigma=0 to generate N training classification
% values y
% (modified given SimLogistic to be sigma=0)
% (modified given SimLogistic so that RealThetas works)
% (modified given SimHousing so free coefficient is first)

% choose your own RealThetas @145
% RealThetas is a column vector of D+1 entries, 
% where first is free coefficient
a = -3;
b = 3;
RealThetas = (b-a) .* rand(D+1, 1) + a;
% output RealThetas to file
dlmwrite('RealThetas.txt', RealThetas);

y_train = SimLogistic(RealThetas, x_train);
y_test  = SimLogistic(RealThetas, x_test);

% output inputs x, y to file for training and test
inp_mat = [x_train, y_train; x_test, y_test];
dlmwrite('Inputs.txt', inp_mat);

% evaluate your classifier

% iv) Perform multiple runs on the same input, with the same and
% different eta, epsilon, and StartingTheta

% options for etas/epsilons
etas = [2, 1, 0.1, 0.01, 0.005];
epsilons = [0.5, 0.25, 0.1, 0.05, 0.01];

% generate different StartingThetas
for st_count = 1:10
    % StartingTheta chosen randomly in (-10, 10)^D
    % StartingTheta is a column vector @139
    % StartingTheta of dim D+1 (not D) @145
    a = -10;
    b = 10;
    StartingTheta = (b-a) .* rand(D+1,1) + a;
    
    % different etas
    for eta_count = 1:size(etas,2)
        eta = etas(eta_count);
        
        % different epsilons
        for epsilon_count = 1:size(epsilons,2)
            epsilon = epsilons(epsilon_count);
            
            % start timer
            start = clock;
            
            % perform this run
            ThetaStar = GradDescentLogistic(x_train, y_train, eta, epsilon, StartingTheta, StopTime);
            
            % stop timer
            runtime = etime(clock, start);
            
            % evaluate the loss
            %logistic loss  L=(y-1)log(1-f(?,x))+ylog(f(?,x))

            x_new = [ones(size(x_train, 1), 1) x_train];
            z = 1 ./ (1 + exp(-ThetaStar' * x_new'));
            z1 = log(1-z);
            z1(isnan(z1)) = 0;
            z1(isinf(z1)) = 0;
            z2 = log(z);
            z2(isnan(z2)) = 0;
            z2(isinf(z2)) = 0;
            train_loss = (y_train-1)'*z1' - y_train'*z2';
            
            x_new = [ones(size(x_test, 1), 1) x_test];
            z = 1 ./ (1 + exp(-ThetaStar' * x_new'));
            z1 = log(1-z);
            z1(isnan(z1)) = 0;
            z1(isinf(z1)) = 0;
            z2 = log(z);
            z2(isnan(z2)) = 0;
            z2(isinf(z2)) = 0;
            
            test_loss = (y_test-1)'*z1' - y_test'*z2';
            
            % write to Runs.txt output file
            run_mat = [eta, epsilon, StartingTheta', ThetaStar', train_loss, test_loss, runtime];
            dlmwrite('Runs.txt', run_mat, '-append');
        end;
    end;
end;