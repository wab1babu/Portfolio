function [h] = hess_E(x, c, A, b, mu)
    [m, n] = size(A);
    %compute the hessian here and store it in h
    %h = eye(size(x, 1));
    h=zeros(n);
    for i=1:m
        h=h+mu*A(i,:)'*A(i,:)/((b(i)-(A(i,:)*x))^2);
    end
    
end