function [g] = grad_E(theta, data)
    g = [0; 0];
    % compute the gradient
    for i=1:20
        xi=data(i,1);
        yi=data(i,2);
        g(1)=g(1)+(exp(theta(1)*xi)+theta(2)-yi)*xi*exp(theta(1)*xi);
        g(2)=g(2)+(exp(theta(1)*xi)+theta(2)-yi);
    end
end