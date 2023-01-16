function [alpha] = linesearch(x, r, p)
    alpha = 1;
    while val_E(x + alpha * p, r) > val_E(x, r)
        alpha = alpha / 2;
    end
end