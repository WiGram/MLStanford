function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% Dimensions: X is (m)x(n+1), y = (m)x1, theta = (n+1)x(m)

h_x = X*theta;        % will have dimension (m)x1
diff = h_x - y;       % will have dimension (m)x1
sq_diff = diff .^ 2;

J = sum(sq_diff) / (2*m);  % will have dimension 1x1

% =========================================================================

end
