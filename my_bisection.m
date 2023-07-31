% Function that approximates the zero of the function of a real variable.
% The function takes as input:
% - a string containing the name of the file where the function is
% described
% - a real number representing the left end of the range
% - a real number representing the right end of the range
% - a tolerance to evaluate the stopping criterion

function [c, N] = my_bisection (f, a, b, tau)

% check the hypothesis of discordant sign at the ends of the range
fa = feval(f, a);
fb = feval(f, b);
if (fa * fb >= 0)
    error("the function does not have discordant sign at the ends of the interval");
end

% number of iterations needed to obtain an approximation of the solution
% within the tolerance
N = ceil(log2((b-a)/tau));

for n = 1:N
    c = a + (b-a)/2;
    fc = feval(f, c);

    if (fc == 0)
        return;
    end

    if (fa * fc < 0)
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
end