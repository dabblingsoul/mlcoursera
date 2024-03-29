function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
[J, grad] = costFunction(theta, X, y)

% Theta0 should not be included
%J += (lambda/(2*m))*sum(theta.^2)

J += (lambda/(2*m))*sum(theta(2:end).^2)

%grad += [0 (lambda*theta(2:size(theta),1)')/m];
%grad = (1/m)*X'*(sigmoid(X*theta)-y)
%grad(0) = 0 %(1/m)*sum(X(1,:)'*sigmoid(X(1,:)*theta - y(0)));

reg_theta=theta(2:end);
%reg_X=X(:,2:end);
%reg_y=y(2:end);
%reg_grad = (1/m)*reg_X'*(sigmoid(reg_X*reg_theta) - reg_y);

grad = grad + (lambda/m)*[0 ; reg_theta]

% =============================================================
end
