function draw_circles(centers, radius)
    n = size(radius, 1);
    hold on
    for i=1:n
        x = @(t) centers(2*i - 1) + radius(i) * cos(t);
        y = @(t) centers(2*i) + radius(i) * sin(t);
        step = 0.1;
        t = 0:step:(2*pi + step);
        plot(x(t), y(t), 'LineWidth', 1);
    end
    line([centers(1), centers(3)], [centers(2), centers(4)], 'LineWidth', 2, 'color', [0, 0, 0]);
    line([0, 0], [0, 10], 'LineWidth', 2, 'color', [0, 0, 0]);
    line([0, 10], [0, 0], 'LineWidth', 2, 'color', [0, 0, 0]);
    line([10, 0], [10, 10], 'LineWidth', 2, 'color', [0, 0, 0]);
    line([10, 10], [10, 0], 'LineWidth', 2, 'color', [0, 0, 0]);
    hold off
    axis equal
    xlim([-1, 11]);
    ylim([-1, 11]);
end