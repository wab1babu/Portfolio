n_circles = 30; % number of circles
rng(0); % set the random seed to 0, so everytime the random config is the same
x = rand(n_circles * 2, 1); % initial coordinates of the circles' center
r = ones(n_circles, 1) - 0.5 * rand(n_circles, 1); % radius of the circles
visualize(x, r); % visualize the initial configuration

total_iter = 1000;
for i=1:1000 % run at most 1000 iterations
    g = grad_E(x, r); % calculate the gradient of E w.r.t. x
    if norm(g) < 1e-3 % stopping criteria
        total_iter = i - 1;
        break
    end
    h = hess_E(x, r); % calculate the hessian of E w.r.t. x
    p = h \ -g; % calculate search direction p by solving h p = -g
    alpha = linesearch(x, r, p); % calculate step size via line search
    x = x + alpha * p; % update x using the computed step size alpha

    % update the visualization
    clf
    visualize(x, r);
    pause(1e-6);
end
sprintf('%d iterations, gradient norm = %f', total_iter, norm(grad_E(x, r)))
