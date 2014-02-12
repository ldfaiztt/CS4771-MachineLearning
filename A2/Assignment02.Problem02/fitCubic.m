function fitCubic()
% UNI = ess2183; polynomial = 2x^3 + x^2 + 8x + 3
uni_poly = [2; 1; 8; 3];
sigma = 0.1;

% Run 1: N=10,  M=10
% Run 2: N=100, M=10
% Run 3: N=10,  M=100
train_test = [10, 10; 100, 10; 10, 100];

% for each run
for run = 1:size(train_test, 1)
    N = train_test(run, 1);
    M = train_test(run, 2);
    
    % generate N training inputs and M testing inputs
    % from uniform distribution (-1,1)
    train_in = rand(N, 1) * 2 - 1;
    test_in  = rand(M, 1) * 2 - 1;

    % use SimPoly to simulate outputs
    train_out = SimPoly(uni_poly, sigma, train_in);
    test_out = SimPoly(uni_poly, sigma, test_in);

    % write train and test x and y to files
    dlmwrite(strcat('x.train.[', int2str(run), '].txt'), train_in);
    dlmwrite(strcat('x.test.[',  int2str(run), '].txt'), test_in);
    dlmwrite(strcat('y.train.[', int2str(run), '].txt'), train_out);
    dlmwrite(strcat('y.test.[',  int2str(run), '].txt'), test_out);

    % perform polynomial curve fitting for degrees (0-8)
    x_new = [];
    for deg = 0:8
        % create the matrix of x values (like in SimPoly)
        x_new = [train_in.^deg x_new];
        
        % calculate optimal coefficients using pseudoinverse
        theta_star = pinv(x_new) * train_out;

        % write theta star coefficients to files
        ts_fname = strcat('ThetaStar.[', int2str(run), '].[', int2str(deg), '].txt');
        dlmwrite(ts_fname, theta_star);
        
    end;
end;

