# Matlab-functions
A collection of functions that solve some known problems in Matlab.  
Problems and algorithms for solving them are shown below.

## Linear systems
Problem description: solving a linear system Ax = b using the most suitable type of algorithm given the properties of the coefficients' matrix A.  

| **Function** |                                                            **Description**                                                           | **Computational cost** |
|:------------:|:------------------------------------------------------------------------------------------------------------------------------------:|:----------------------:|
|   my_diag.m  | _Function that solves the linear system Dx = b, where D is a diagonal matrix._                                                       |         $O(n)$         |
|   my_tril.m  | _Function that solves the linear system Lx = b, where L is a lower triangular matrix._                                               |   $O(\frac{n^2}{2})$   |
|   my_triu.m  | _Function that solves the linear system Ux = b, where U is an upper triangular matrix._                                              |   $O(\frac{n^2}{2})$   |
|    my_lu.m   | _Function that calculates the LU factorization of a matrix A. It uses Gauss factorization method._                                   |   $O(\frac{n^3}{3})$   |
|  my_lu_piv.m | _Function that calculates the LU factorization of a matrix A. It uses Gauss factorization method with partial pivoting._             |   $O(\frac{n^3}{3})$   |
|   my_ldl.m   | _Function that calculates the LDL factorization of a matrix A. It uses the Gauss factorization method for symmetric matrices._       |   $O(\frac{n^3}{6})$   |
|  my_jacobi.m | _Function that calculates the solution of a linear system Ax=b using Jacobi method. It also returns the number of iterations._       | $O(n^2)$ per iteration |
| my_GSeidel.m | _Function that calculates the solution of a linear system Ax=b using Gauss-Seidel method. It also returns the number of iterations._ | $O(n^2)$ per iteration |

In order to solve complex problems that requires factorization, the solution is given by decomposing the system into several triangular or diagonal subsystems using the matrices obtained from the factorization.  
Whereas Jacobi and Gauss-Seidel algorithms are iterative methods, the others are direct methods.  

## Non-linear equations
Problem description: finding a zero of a given function.  

|  **Function**  |                              **Description**                              |         **Computational cost**         |
|:--------------:|:-------------------------------------------------------------------------:|:--------------------------------------:|
| my_bisection.m | _Function that approximates a zero of a function with one real variable._ | One function evaluation per iteration. |

The functions whose root is to be found can be stored in *my_function.m*, fruthermore using the script *plot_my_function_zero.m* the calculated root can be graphically displayed.  

## Interpolation
Problem description: given n fixed points in the cartesian plane, finding a function $g:[a, b] &#8594 R$ that passes through all the points.  

|      **Function**      |                                                                      **Description**                                                                      | **Computational cost** |
|:----------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------:|:----------------------:|
|    my_vandermonde.m    | _Takes as input a vetor x of length n that represents the x-coordinates of interpolation points (nodes) and produces the Vandermonde matrix._             |        $O(n^3)$        |
| my_lagrange_interpol.m | _Function which, given n+1 point, evaluates the interpolating polynomial of degree n. It is calculated using the Lagrange interpolation theorem._ |        $O(n^2)$        |

The calculation of vandermonde matrix is part of the so called **method of undeterminate coefficients**: it is about solving the linear system $V \alpha = y$, the solution are the coefficients of the interpolation polynomial $p_n(x)$ in canonical form.  
In order to avoid Runge phenomenon, Chebychev nodes can be generated using *my_ceb_nodes.m* for a better nodes partitioning method.  

## Least squares
Problem description: finding the function that aproximates better the given points, knowing the mathematical model of the function.

|       **Function**      |                                                                                                    **Description**                                                                                                    | **Computational cost** |
|:-----------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:----------------------:|
|    my_least_squares.m   | Function that solves the least squares problem (general linear case). Valid for the non-degenerate case, i.e. when the rank of the matrix associated with the model is equal to the number of parameters. |   $O(\frac{2n^3}{3})$  |
| my_least_squares_poly.m | _Function that solves the least squares problem (polynomial case). Valid for the non-degenerate case, i.e. when the rank of the matrix associated with the model is equal to the number of parameters._               |   $O(\frac{2n^3}{3})$  |
