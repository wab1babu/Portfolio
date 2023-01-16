function [z] = LBFGS(g, s, y)
    m = min(5, size(s,2)); % for the first few iterations, there will be less than 5 histories to use
    if m == 0 % if no history, use negative gradient direction
        z = -g;
    else
        alpha = zeros(m);
        rho = zeros(m);
        beta = zeros(m);
        q = g;
        for i = m:(-1):1
            %calculate rho, alpha(i), and then update q
            rho(i)=1/(y(:,i)'*s(:,i));
            alpha(i)=rho(i)*s(:,i)'*q;
            q=q-alpha(i)*y(:,i);
            %TODO
        end
         
        %calculate gamma using s(:,end) and y(:,end)
        gamma=(s(:,end)'*y(:,end))/(y(:,end)'*y(:,end));
        z = gamma * q;
        for i = 1:m
            %calculate rho, beta, and then update z
            beta(i)=rho(i)*y(:,i)'*z;
            z = z+s(:,i)*(alpha(i)-beta(i));
        end
        z = -z;
    end
end