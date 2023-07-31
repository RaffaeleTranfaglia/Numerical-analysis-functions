% Function that calculates the solution of a linear system Ax=b using
% Jacobi method.
% It also returns the number of iterations.
% x0 is the starting point, Kmax is the safeguard threshold, tau is the
% tolerance to handle the stop criteria.

function [x0, k] = my_jacobi (A, b, x0, Kmax, tau)

D = diag(A);
N = -(tril(A, -1) + triu(A, 1));
for k = 0:Kmax
    res = b - A*x0; % residual = b - A * current iteration
    x = (N*x0 + b) ./ D;
    dist = norm(x - x0);
    if (dist < tau*norm(x) & res < tau*norm(b)) % stop criteria check
        return;
    else
        x0 = x;
    end
end
error ('safeguard parameter exceeded');