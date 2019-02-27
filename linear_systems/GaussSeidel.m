function x = GaussSeidel(A, b, es, maxit)
    % GaussSeidel: Gauss Seidel method
    % x = GaussSeidel(A,b): Gauss Seidel without relaxation
    %
    % input:
    % A = coefficient matrix
    % b = right hand side vector
    % es = stop criterion
    % maxit = max iterations
    %
    % output:
    % x = solution vector
    
    [m,n] = size(A);
    if m~=n
        error('Matrix A must be square')
    end
    d = zeros(n,1);
    x = zeros(n,1);
    C = A;
    for i = 1:n
        C(i,i) = 0;
        C(i,1:n) = C(i,1:n)/A(i,i);
        d(i) = b(i)/A(i,i);
    end
    ea = zeros(n,1);
    for iter = 1:maxit
        xold = x;
        x = d - C*x;
        idx = x == 0;
        ea(idx) = 0;
        ea(~idx) = abs((x(~idx) - xold(~idx))./x(~idx));
        if max(ea) <= es
            break
        end
    end
    if iter == maxit
        warning(['Relative error criterion not satified. Please increas'...
                 'e the maximum allowable number of iterations or reduc'...
                 'e the desired relative error.'])
    end
end