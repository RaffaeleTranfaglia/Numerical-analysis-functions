% Function that solves the least squares problem (polynomial case).
% Valid for the non-degenerate case, i.e. when the rank of the rectangular
% matrix associated with the model is equal to the number of parameters.
% INPUT:
% - x, a vector of m elements (x-coordinates)
% - y, a vector of m elements (y-coordinates)
% - n_param, number of parameters of the model (the coefficients to determine)
% - check_rank, if true check the rank

function alpha = my_least_squares_poly (x, y, n_param, check_rank)
% we assume vectors x and y are columns

n = n_param;
m = length(x);

if (n > m)
    error("error: length(x) has to be bigger than n_param.")
end

% calculates the vandermonde matrix
A = ones(m, n);
for j = 2:n 
    A(:,j) = A(:,j-1) .* x;
end

if check_rank && (rank(A) < n_param)
    error("error: degenerate case.")
end

% QR factorization of A (using the matlab function qr)
[Q, R] = qr(A);
% QR factorization for non-square matrices returns as R a rectangular
% matrix mxn. The first n rows and n columns of R compose an upper
% triangular matrix.
R = R(1:n, 1:n);

y_tilde = Q' * y;
alpha = my_triu(R, y_tilde(1:n));
% alternatively alpha = R \ y_tilde(1:n);

