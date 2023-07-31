% Generates n Chebyshev nodes in [a, b]

function t = my_ceb_nodes(a, b, n)

% creates Chebyshev nodes in the range [-1, 1] 
t = cos(((2*(0:n-1) + 1)*pi) / (2*n));

% transfers Chebyshev nodes into [a, b]
t = (b - a)/2 * t + (a + b)/2;

% transform t into a column
t = t';