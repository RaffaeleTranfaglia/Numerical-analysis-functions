% Function that solves the linear system Dx = b, where D is a diagonal 
% matrix. It assumes b as a column vector.
% Returns the column vector of solutions x.

function x = my_diag (D, b)

if (isdiag(D) == false)
    error ("matrix D is not diagonal");
end

d = diag(D);

x = b ./ d;