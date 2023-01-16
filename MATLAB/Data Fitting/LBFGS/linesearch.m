function [stepsize] = linesearch(xi, p, upperbound, f)
    % backtracking line search:
    stepsize = upperbound;
    while f(xi + stepsize * p) > f(xi)
        stepsize = stepsize / 2;
    end
end