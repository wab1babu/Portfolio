function [g] = grad(theta, data)
    g = [0; 0];
    for i=1:size(data,1)
        g = g + (exp(theta(1) * data(i,1)) + theta(2) - data(i,2)) * [data(i,1)*exp(theta(1)*data(i,1)); 1];
    end
end