function svm(test)
% Emily Schultz (ess2183)
% Create the SVM, based on the value of test
% then classify the training inputs and determine the number of incorrectly
% classified (displayed as wrong percent)

% default is best version
if nargin < 1 || test > 8 || test < 1
    test = 8;
end

if test == 1
    % using only X - linear kernel function
    load('Data.mat');
    svm_model = svmtrain(X, y_int);
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, X);
    wrong = sum(abs(y_predict - y_int));
    wrong_percent = (wrong/size(X,1)) * 100;
    % 2.16
elseif test == 2
    % using X and y_real - linear kernel function
    load('Data.mat');
    svm_model = svmtrain([X y_real], y_int);
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, [X y_real]);
    wrong = sum(abs(y_predict - y_int));
    wrong_percent = (wrong/size(X,1)) * 100;
    % 2.13
elseif test == 3
    % using only X - quadratic kernel function
    load('Data.mat');
    svm_model = svmtrain(X, y_int, 'kernel_function', 'quadratic');
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, X);
    wrong = sum(abs(y_predict - y_int));
    wrong_percent = (wrong/size(X,1)) * 100;
    % 0.38
elseif test == 4
    % using X and y_real - quadratic kernel function
    load('Data.mat');
    svm_model = svmtrain([X y_real], y_int, 'kernel_function', 'quadratic');
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, [X y_real]);
    wrong = sum(abs(y_predict - y_int));
    wrong_percent = (wrong/size(X,1)) * 100;
    % 0.23
elseif test == 5
    % using only X - polynomial kernel function (degree 3)
    load('Data.mat');
    svm_model = svmtrain(X, y_int, 'kernel_function', 'polynomial');
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, X);
    wrong = sum(abs(y_predict - y_int));
    wrong_percent = (wrong/size(X,1)) * 100;
    % 0.17
elseif test == 6
    % using X and y_real - polynomial kernel function (degree 3)
    load('Data.mat');
    svm_model = svmtrain([X y_real], y_int, 'kernel_function', 'polynomial');
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, [X y_real]);
    wrong = sum(abs(y_predict - y_int));
    wrong_percent = (wrong/size(X,1)) * 100;
    % 0.06
elseif test == 7
    % using only X - polynomial kernel function
    load('Data.mat');
    svm_model = svmtrain(X, y_int, 'kernel_function', 'polynomial', 'polyorder', 4);
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, X);
    wrong = sum(abs(y_predict - y_int));
    wrong_percent = (wrong/size(X,1)) * 100;
    % 0
elseif test == 8
    % using X and y_real - polynomial kernel function
    load('Data.mat');
    svm_model = svmtrain([X y_real], y_int, 'kernel_function', 'polynomial', 'polyorder', 4);
    save('SVM.mat', 'svm_model');

    y_predict = svmclassify(svm_model, [X y_real]);
    wrong = sum(abs(y_predict - y_int));
    wrong_percent = (wrong/size(X,1)) * 100;
    % 0
end
disp(wrong_percent);
end