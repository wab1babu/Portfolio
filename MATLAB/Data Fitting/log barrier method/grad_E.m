function [g] = grad_E(x, c, A, b, mu)
    [m, n] = size(A);
    %compute the gradient here and store it in g
    g = zeros(size(x));
    g = c;
    for i=1:m
        g=g+mu*(A(i,:))'/(b(i)-(A(i,:)*x));
    end
    
end