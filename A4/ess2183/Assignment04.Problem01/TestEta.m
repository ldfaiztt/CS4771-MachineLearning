% Demonstrate problems with too large/small eta

% TODO: update this to result from part b
eta_0 = 0.005;
epsilon = 0.01;

k_list = [-3:3];
% consecutive positive and negative integers k
for k_count = 1:size(k_list, 2)
    k = k_list(k_count);
    eta = 2^k * eta_0;
    
    % StartingTheta chosen randomly in (-10, 10)^D
    a = -10;
    b = 10;
    StartingTheta = (b-a) .* rand(D+1,1) + a;
    
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
    train_loss = (y_train-1)'*log(1-z)' - y_train'*log(z)';
    
    x_new = [ones(size(x_test, 1), 1) x_test];
    z = 1 ./ (1 + exp(-ThetaStar' * x_new'));
    test_loss = (y_test-1)'*log(1-z)' - y_test'*log(z)';
    
    % write run results to file
    run_mat = [eta, epsilon, StartingTheta', ThetaStar', train_loss, test_loss, runtime];
    dlmwrite('EtaRuns.txt', run_mat, '-append');
end;