% Function that calculates the LU factorization of a matrix A.
% It uses Gauss factorization method with partial pivoting.
% It returns the matrices L, U and P such that P*A = L*U.

function [L, U, P] = my_lu_piv (A)
n = length(A);
P = eye(n);
for k = 1:n-1
    [~, r] = max(abs(A(k:n, k)));
    r = r + k-1;
    % rows swap
    if (r ~= k)
        tmp = A(k, :);
        A(k, :) = A(r, :);
        A(r, :) = tmp;

        tmp = P(k, :);
        P(k, :) = P(r, :);
        P(r, :) = tmp;
    end
    
    if (abs(A(k, k)) < eps)  % check that A(k, k) is not null
        error("\n factorization non executable \n");
    end

    A(k+1:n, k) = A(k+1:n, k) / A(k, k);
    A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
end

L = tril(A, -1);
L = L + eye(n);
U = triu(A);