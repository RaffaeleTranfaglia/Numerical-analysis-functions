% Function that calculates the LDL factorization of a matrix A.
% It uses the Gauss factorization method for symmetric matrices.
% It returns the matrices L and D such that L*D*L' = A.

function [L, D] = my_ldl (A)
if (issymmetric(A) == 0)
    error('non symmetric matrix');
end

n = length(A);
P = zeros(n);
L = eye(n);
D = zeros(n,1);
for j = 1:n
    P(j, 1:j-1) = L(j, 1:j-1) .* D(1:j-1)';
    D(j) = A(j, j) - L(j, 1:j-1) * P(j, 1:j-1)';
    if (abs(D(j)) < eps)
        error('factorization not executable')
    end

    for i = 1:n
        L(i, j) = (A(i, j) - L(i, 1:j-1) * P(j, 1:j-1)') / D(j);
    end
end

D = diag(D);