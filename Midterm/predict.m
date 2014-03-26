function [y_int] = predict(X, y_real)
%PROBLEM02: Predict integer output given input and real output
% x is NxD (N=10000, D=9)
% y_real and y_int are both Nx1

% load the support vector machine (trained in svm.m)
load('SVM.mat');

% classify
input_data = [X y_real];
y_int = svmclassify(svm_model, input_data);

end