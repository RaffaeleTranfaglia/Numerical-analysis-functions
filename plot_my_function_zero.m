% Plots the zero of the function.
% The zero may be calculated using the function that implements bisection 
% method.
% % The function takes as input:
% - a string containing the name of the file where the function is
% described
% - a real number representing the left end of the range
% - a real number representing the right end of the range
% - the number of sampling points
% - the value of the calculated zero


function plot_my_function_zero (f, a, b, n_pts, zero)

figure
x = linspace(a, b, n_pts);
y = feval(f, x);

hold on

plot(x, y, 'b');
plot(x, zeros(1, length(x)), 'k');
plot(zero, 0, 'or');