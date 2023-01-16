、function [alpha] = linesearch(x, p, c, A, b, mu)
    [m, n] = size(A);
    alpha = 1;
    for i = 1:m
        if A(i,:) * p > 0
            alpha = min(alpha, 0.9 * (b(i) - A(i,:) * x) / (A(i,:) * p));
        end
    end

    while val_E(x + alpha * p, c, A, b, mu) > val_E(x, c, A, b, mu)
        alpha = alpha / 2;
    end
end