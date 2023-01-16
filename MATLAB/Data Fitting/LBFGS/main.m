data = csvread('data.csv'); % read data from data.csv
% now data is a 20-by-2 matrix, where
% the 1st column is x_i
% the 2nd column is y_i

% objective function evaluation for line search
f = @(theta) sum((exp(theta(1)*data(:,1)) + theta(2) - data(:,2)).^2);

hold on
scatter(data(:,1), data(:,2), 'LineWidth', 2); % visualize the data points

% next, we fit the data using the curve 
% f(x_i, theta) = exp(theta(1) * x_i) + theta(2);
% by minimizing the nonlinear least squares E w.r.t. theta:
theta = [0; 0]; % initial guess
theta_seq = theta;
s = []; % to store x_(i+1) - x_i
y = []; % to store g_(i+1) - g_i
for i=1:1000 % run at most 1000 iterations
    g = grad_E(theta, data); % calculate the gradient of E w.r.t. theta
    if norm(g) < 1e-4 % stopping criteria
        break
    end
    p = LBFGS(g, s, y); % calculate the search direction using the gradient g and history information
    alpha = linesearch(theta, p, 1, f); % backtracking line search to ensure energy decrease
    theta = theta + alpha * p; % update theta using step size alpha
    theta_seq = [theta_seq, theta];
    
    % record history information:
    s = [s, alpha * p];
    y = [y, grad_E(theta, data) - g];
    if size(s,2) > 5 % only store them from the past 5 iterations
        s = s(:,(end-4):end);
        y = y(:,(end-4):end);
    end
end
sprintf('%d iterations, gradient norm = %f', size(theta_seq, 2), norm(grad_E(theta, data)))

% visualize our fitted curve:
f = @(x) exp(theta(1) * x) + theta(2);
x=linspace(0, 1, 100);
plot(x, f(x), 'LineWidth', 2);
lgd = legend('data points', 'fitted curve', 'location', 'northwest');
lgd.FontSize = 20;
hold off