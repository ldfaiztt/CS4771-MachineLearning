plot_vec = [];

for N = 5:5:50
    [Margin, SupportVs, Slope, Intercept, x0, x1] = Test_LKS_SVM(N);
    plot_vec = [plot_vec; N, Margin];
    
end;
% plot margin as function of N
plot(plot_vec(:, 1), plot_vec(:,2), '.');