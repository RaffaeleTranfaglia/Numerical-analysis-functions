% Function that calculates the solution of a linear system Ax=b using
% Gauss-Seidel method.
% It also returns the number of iterations.
% x0 is the starting point, Kmax is the safeguard threshold, tau is the
% tolerance to handle the stop criteria.

function [x0, k] = my_GSeidel (A, b, x0, Kmax, tau)

D_E = tril(A);
F = - triu(A, 1);
for k = 0:Kmax
    res = b - A*x0; % residual = b - A * current iteration
    x = D_E \ (F*x0 + b); % mldivide becacuse it is a triangular system
    dist = norm(x - x0);
    if (dist < tau*norm(x) & res < tau*norm(b)) % stop criteria check
        return;
    else
        x0 = x;
    end
end
error ('safeguard parameter exceeded');