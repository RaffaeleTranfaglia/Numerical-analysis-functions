% Function that solves the linear system Lx = b, where L is a lower 
% triangular matrix. It uses the forward substitution algorithm.
% Returns the column vector of solutions x.

function x = my_tril (L, b)

if (istril(L) == false)
    error ("matrix L is not lower triangular");
end

n = length(b);
x = zeros(n, 1);

for j = 1:n
    x(j) = (b(j) - L(j, 1:j-1) * x(1:j-1)) / L(j, j);
end