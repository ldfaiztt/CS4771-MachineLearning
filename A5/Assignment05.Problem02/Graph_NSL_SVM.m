plot_vec = [];
N_vec = [10,20,50];
c_vec = [1,2,3,4,5,6,7,8,9,10];

for i=1:size(N_vec,2)
    for c_i = 1:size(c_vec,2)
        N = N_vec(i);
        C = c_vec(c_i);
        Nfalse = .1*N;
        [Nmiss, Margin, SupportVs, Slope, Intercept, x0, x1] = Test_NSL_SVM(N, Nfalse, C);
        plot_vec = [plot_vec; C, Margin, Nmiss];
    end
end;
% plot margin, Nmiss as function of N
plot(plot_vec(:, 1), plot_vec(:,2), '.');
plot(plot_vec(:, 1), plot_vec(:,3), '.');