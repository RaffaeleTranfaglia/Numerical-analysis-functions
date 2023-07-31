% Function that solves the least squares problem (general linear case).
% Valid for the non-degenerate case, i.e. when the rank of the rectangular
% matrix associated with the model is equal to the number of parameters.
% INPUT:
% - x, a vector of m elements (x-coordinates)
% - y, a vector of m elements (y-coordinates)
% - f, vector of functions
% - check_rank, if true check the rank

function alpha = my_least_squares (x, y, f, check_rank)
% we assume vectors x and y are columns

n = length(f); % the model is a linear combination of the functions
m = length(x);

if (n > m)
    error("error: length(x) has to be bigger than lenght(f).")
end

% calculates the matrix related to the data distribution
A = zeros(m, n);
for j = 1:n 
    A(:,j) = f{j}(x);
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
