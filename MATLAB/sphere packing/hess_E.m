function [h] = hess_E(x, r)
    n = size(r, 1);
    h = zeros(n * 2, n * 2);
    for i=1:(n-1)
        x_i = x((i*2-1):(i*2), 1);
        for j=(i+1):n
            x_j = x((j*2-1):(j*2), 1);
            d_sqr = dot(x_i - x_j, x_i - x_j);
            rij_sqr = power(r(i) + r(j), 2);
            if d_sqr < rij_sqr
                hess = -24 * (d_sqr - rij_sqr) * (x_i - x_j) * (x_i - x_j)';
                h((i*2-1):(i*2), (i*2-1):(i*2)) = h((i*2-1):(i*2), (i*2-1):(i*2)) + hess;
                h((i*2-1):(i*2), (j*2-1):(j*2)) = h((i*2-1):(i*2), (j*2-1):(j*2)) - hess;
                h((j*2-1):(j*2), (i*2-1):(i*2)) = h((j*2-1):(j*2), (i*2-1):(i*2)) - hess;
                h((j*2-1):(j*2), (j*2-1):(j*2)) = h((j*2-1):(j*2), (j*2-1):(j*2)) + hess;
            end
        end
    end

    %handle the bound constraints
    % for any circle i, its center x_i should stay inside the square [r_i, 10 - r_i]^2
    for i=1:n
        x_i = x((i*2-1):(i*2),1);
        if x_i(1) < r(i)
            h((i*2-1),(i*2-1))=h((i*2-1),(i*2-1))-6*(x_i(1)-r(i));
        elseif x_i(1) > 10-r(i)
            h((i*2-1),(i*2-1))=h((i*2-1),(i*2-1))+6*(x_i(1)-(10-r(i)));
        end
        if x_i(2) < r(i)
            h((i*2),(i*2))=h((i*2),(i*2))-6*(x_i(2)-r(i));
        elseif x_i(2) > 10-r(i)
            h((i*2),(i*2))=h((i*2),(i*2))+6*(x_i(2)-(10-r(i)));
        end
    end
    %handle the equality constraint 
    % || x_1 - x_2 || = r_1 + r_2
    d_sqr=dot(x(1:2,1)-x(3:4,1),x(1:2,1)-x(3:4,1));
    rij_sqr=(r(1)+r(2))^2;
    if (d_sqr>rij_sqr)
        h(1,1)=h(1,1)+20*(x(1,1)-x(3,1))^3;
        h(2,1)=h(2,1)+20*(x(2,1)-x(4,1))^3;
        h(3,1)=h(3,1)+20*(x(1,1)-x(3,1))^3;
        h(4,1)=h(4,1)+20*(x(2,1)-x(4,1))^3;
    end
    

    h = h + 1e-6 * eye(n * 2, n * 2);
end