% Function that calculates the LU factorization of a matrix A.
% It uses Gauss factorization method.
% It returns the matrices L, U such that A = L*U.

function [L, U] = my_lu (A)
n = length(A);
for k = 1:n-1
    if (abs(A(k, k)) < eps) % check that A(k, k) is not null
        error("\n factorization non executable \n");
    end
    A(k+1:n, k) = A(k+1:n, k) / A(k, k);
    A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
end

L = tril(A, -1);
L = L + eye(n);
U = triu(A);