function svm(test)
% Emily Schultz (ess2183)
% Create the SVM, based on the value of test
% then classify the training inputs and determine the number of incorrectly
% classified (displayed as the percentage classification error)
load('Data.mat');

% default is best version
if nargin < 1 || test > 8 || test < 1
    test = 8;
end

if test == 1
    % using only X - linear kernel function
    svm_model = svmtrain(X, y_int);
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, X);
    % 2.16
elseif test == 2
    % using X and y_real - linear kernel function
    svm_model = svmtrain([X y_real], y_int);
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, [X y_real]);
    % 2.13
elseif test == 3
    % using only X - quadratic kernel function
    svm_model = svmtrain(X, y_int, 'kernel_function', 'quadratic');
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, X);
    % 0.38
elseif test == 4
    % using X and y_real - quadratic kernel function
    svm_model = svmtrain([X y_real], y_int, 'kernel_function', 'quadratic');
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, [X y_real]);
    % 0.23
elseif test == 5
    % using only X - polynomial kernel function (degree 3)
    svm_model = svmtrain(X, y_int, 'kernel_function', 'polynomial');
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, X);
    % 0.17
elseif test == 6
    % using X and y_real - polynomial kernel function (degree 3)
    svm_model = svmtrain([X y_real], y_int, 'kernel_function', 'polynomial');
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, [X y_real]);
    % 0.06
elseif test == 7
    % using only X - polynomial kernel function
    svm_model = svmtrain(X, y_int, 'kernel_function', 'polynomial', 'polyorder', 4);
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, X);
    % 0
elseif test == 8
    % using X and y_real - polynomial kernel function
    svm_model = svmtrain([X y_real], y_int, 'kernel_function', 'polynomial', 'polyorder', 4);
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, [X y_real]);
    % 0
end
wrong = sum(abs(y_predict - y_int));
class_error = (wrong/size(X,1)) * 100;
disp(class_error);
end