function [g] = grad_E(x, r)
    n = size(r, 1);
    g = zeros(size(x));
    for i=1:(n-1)
        x_i = x((i*2-1):(i*2), 1);
        for j=(i+1):n
            x_j = x((j*2-1):(j*2), 1);
            d_sqr = dot(x_i - x_j, x_i - x_j);
            rij_sqr = power(r(i) + r(j), 2);
            if d_sqr < rij_sqr
                grad = -6 * power(d_sqr - rij_sqr, 2) * (x_i - x_j);
                g((i*2-1):(i*2), 1) = g((i*2-1):(i*2), 1) + grad;
                g((j*2-1):(j*2), 1) = g((j*2-1):(j*2), 1) - grad;
            end
        end
    end

    %handle the bound constraints
    % for any circle i, its center x_i should stay inside the square [r_i, 10 - r_i]^2
    for i=1:n
        x_i = x((i*2-1):(i*2),1);
        if x_i(1) < r(i)
            g((i*2-1),1)=g((i*2-1),1)-3*(x_i(1)-r(i))^2;
        elseif x_i(1) > 10-r(i)
            g((i*2-1),1)=g((i*2-1),1)+3*(x_i(1)-(10-r(i)))^2;
        end
        if x_i(2) < r(i)
            g((i*2),1)=g((i*2),1)-3*(x_i(2)-r(i))^2;
        elseif x_i(2) > 10-r(i)
            g((i*2),1)=g((i*2),1)+3*(x_i(2)-(10-r(i)))^2;
        end
    end
    %handle the equality constraint 
    % || x_1 - x_2 || = r_1 + r_2
    d_sqr=dot(x(1:2,1)-x(3:4,1),x(1:2,1)-x(3:4,1));
    rij_sqr=(r(1)+r(2))^2;
    if (d_sqr>rij_sqr)
        g(1,1)=g(1,1)+5*(x(1,1)-x(3,1))^4*sign((x(1,1)-x(3,1)));
        g(2,1)=g(2,1)+5*(x(2,1)-x(4,1))^4*sign((x(2,1)-x(4,1)));
        g(3,1)=g(3,1)-5*(x(1,1)-x(3,1))^4*sign((x(1,1)-x(3,1)));
        g(4,1)=g(4,1)-5*(x(2,1)-x(4,1))^4*sign((x(2,1)-x(4,1)));
    end
end