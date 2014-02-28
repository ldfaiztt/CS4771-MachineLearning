% Demonstrate problems with too large/small eta

% TODO: update this to result from part b
eta_0 = 0.5;
epsilon = 0.5;

k_list = [-3:3];
% consecutive positive and negative integers k
for k_count = 1:size(k_list, 2)
    k = k_list(k_count);
    eta = 2^k * eta_0;
    
    % StartingTheta chosen randomly in (-10, 10)^D
    a = -10;
    b = 10;
    StartingTheta = (b-a) .* rand(D+1,1) + a;
    
    
    % write run results to file
    run_mat = [eta, epsilon, StartingTheta', ThetaStar', train_loss, test_loss, time];
    dlmwrite('EtaRuns.txt', run_mat, '-append');
end;