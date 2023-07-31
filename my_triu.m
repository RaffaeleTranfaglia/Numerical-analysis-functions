% Function that solves the linear system Ux = b, where U is an upper
% triangular matrix. It uses the backward substitution algorithm.
% Returns the column vector of solutions x.

function x = my_triu (U, b)

if (istriu(U) == false)
    error ("matrix U is no upper triangular");
end

n = length(b);
x = zeros(n, 1);

for j = n:-1:1
    x(j) = (b(j) - U(j, j+1:n) * x(j+1:n)) / U(j, j);
end