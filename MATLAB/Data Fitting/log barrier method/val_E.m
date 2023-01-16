function [E] = val_E(x, c, A, b, mu)
    [m, n] = size(A);
    %compute the objective energy value here and store it in E
    %E = 0;
    E = c'*x;
    for i=1:m
        E=E-mu*log(b(i)-(A(i,:)*x));
    end
    
end