function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
T1_features = input_layer_size + 1;  % actiovation nodes at previous layer + 1
T1_outcomes = hidden_layer_size;  % activation nodes at next layer
T1_pars = T1_outcomes * T1_features;

Theta1 = reshape(nn_params(1:T1_pars), T1_outcomes, T1_features);

T2_features = hidden_layer_size + 1;  % the hidden layer is now input to the outcome layer
T2_outcomes = num_labels;
T2_par_start_index = T1_pars + 1;  % T2 starts at first index after T1 ends.

Theta2 = reshape(nn_params(T2_par_start_index:end), T2_outcomes, T2_features);
                 
% Setup some useful variables
m = size(X, 1);  % Training examples (rows of X)
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Compute h for the cost function
A1 = [ones(m, 1) X];
z2 = A1 * Theta1';
A2 = sigmoid(z2);

A2 = [ones(m, 1) A2];
z3 = A2 * Theta2';
h = sigmoid(z3);

% Convert(Mx1)-vector y into (M*K)-matrix Y with only one '1' in each row
% Where if row m = 4 in vector y then column 4 in row m of Y is 1

Y = zeros(m, num_labels);

for i = 1:m ...
  k = y(i);
  Y(i, k) = 1;
endfor

% cost function J
pos = Y .* log(h);
neg = (1 - Y) .* log(1 - h);
J = - sum(sum((pos + neg) / m));

% regularisation -- We don't add the bias term - doesn't belong to an exogenous feature
Theta1_adj = Theta1(:, 2:end);
Theta2_adj = Theta2(:, 2:end);
R = lambda / (2*m) * (sum(sum(Theta1_adj .^ 2)) + sum(sum(Theta2_adj .^ 2)));
J = J + R;

% gradient
for t = 1:m ...
  a1 = [1, X(t, :)];
  
  z2 = a1 * Theta1';
  a2 = [1, sigmoid(z2)];
  
  z3 = a2 * Theta2';
  h = sigmoid(z3);
  
  % Errors
  d3 = (h - Y(t, :))';
  
  Theta2_grad = Theta2_grad + d3 * a2;  % outer product
  g2 = sigmoidGradient(z2)';
  d2 = Theta2_adj' * d3 .* g2;  % We do not take the bias into account
  
  Theta1_grad = Theta1_grad + d2 * a1;
  % d1: We assume no error on the first layer
endfor

Theta1_grad = Theta1_grad ./ m;
Theta2_grad = Theta2_grad ./ m;

% Regularisation

reg_1 = (lambda / m) .* Theta1;
reg_1 = [zeros(hidden_layer_size, 1), reg_1(:, 2:end)];

reg_2 = (lambda / m) .* Theta2;
reg_2 = [zeros(num_labels, 1), reg_2(:, 2:end)];

Theta1_grad = Theta1_grad + reg_1;
Theta2_grad = Theta2_grad + reg_2;


% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
