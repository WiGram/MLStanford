function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = [0.01, 0.03, 0.1, 0.3, 1.00, 3.00, 10.00, 30.00];
sigma = C;
error = zeros(length(C), length(sigma));

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
for i = 1:length(C) ...
  for j = 1:length(sigma) ...
    c = C(i);
    s = sigma(j);
    model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s));
    pred = svmPredict(model, Xval);
    error(i, j) = mean(double(pred ~= yval));
  endfor
endfor

% The smallest values in each column
[val1, idx1] = min(error);

% The smallest value among those
[val2, idx2] = min(val1);

C = C(idx1(idx2));  %
sigma = sigma(idx2);



% =========================================================================

end
