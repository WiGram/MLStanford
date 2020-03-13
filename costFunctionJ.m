function J = costFunctionJ(X, y, theta)
% X is the "design matrix" containing our training examples
% Y is the class labels
m = size(X, 1);  % number of training examples
predictions = X*theta;  % predictions of hypotheses on all m
sqrErrors = (predictions - y) .^ 2;  % square errors

J = 1/(2*m) * sum(sqrErrors);