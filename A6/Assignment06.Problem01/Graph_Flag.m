% Run tests with different N and plot the boundaries of the 3 learnt
% SVM classifiers
n_vec = [10,20,30];

for i = 1:size(n_vec,2)
    N = n_vec(i);
    [SupportVs, Theta, x0, x1] = Test_NLK_SVM(N);
    plot(x0(:,1), x0(:,2), '.y'); hold on;
    plot(x1(:,1), x1(:,2), '.b'); hold on;
end