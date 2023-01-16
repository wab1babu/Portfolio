
A = [5 6;
    3 2;
    -1 0;
    0 -1];
b = [30; 12; 0; 0];
c = [-1; -5];

mu = 0.001; % stiffness of the barrier
% In practical large-scale problems, setting a proper mu that gives a proper
% barrier function that is both smooth so fast to converge and sharp so
% accurately enough approximating the original problem is crucial!

x = [0.1; 0.1]; % a feasible initial guess

x_seq = x; % the array to store the estimated solution
for i=1:1000 % run at most 1000 iterations
    g = grad_E(x, c, A, b, mu); % calculate the gradient of E w.r.t. x
    if norm(g) < 1e-3 % stopping criteria
        break
    end
    h = hess_E(x, c, A, b, mu); % calculate the hessian of E w.r.t. x
    p = h \ -g; % calculate search direction p by solving h p = -g
    alpha = linesearch(x, p, c, A, b, mu); % calculate step size via line search
    x = x + alpha * p; % update x using the computed step size alpha
    x_seq = [x_seq, x]; % record the current estimate
end
sprintf('%d iterations, gradient norm = %f, objective = %f', size(x_seq, 2), norm(grad_E(x, c, A, b, mu)), c' * x)
x % print solution