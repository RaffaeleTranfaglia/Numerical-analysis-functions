% Takes as input a vetor x of length n that represents the x-coordinates
% of interpolation points (nodes) and produces the Vandermonde matrix.

function V = my_vandermonde(x)

n = length(x);
V = ones(n);

for j = 2 : n
    V(:,j) = V(:,j-1) .* x;
end
