function [h] = hess_E(theta, data)
    h = [0 0; 0 0];
    % compute the Gauss-Newton approximation of the hessian
    for i=1:20
        xi=data(i,1);
        h=h+[xi^2*exp(2*theta(1)*xi),xi*exp(theta(1)*xi);xi*exp(theta(1)*xi),1];
    end
    
end