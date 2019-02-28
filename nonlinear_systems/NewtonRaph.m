function [x, fx] = NewtonRaph(func, J, x0, es, maxit)
    % newtmult: Newton-Raphson root zeroes nonlinear systems
    % [x,f,ea,iter]=newtmult(func,J,x0,es,maxit):
    % uses the Newton-Raphson method to find the roots of
    % a system of nonlinear equations
    % input:
    % func = name of function that returns f
    % J = name of function that returns the Jacobian matrix
    % x0 = initial guess
    % es = desired percent relative error (default = 0.0001%)
    % maxit = maximum allowable iterations (default = 50)
    % p1,p2,... = additional parameters used by function
    % output:
    % x = vector of roots
    % f = vector of functions evaluated at roots
    % ea = approximate percent relative error (%)
    % iter = number of iterations
    x = x0;
    for iter = 1:maxit
        fx = func(x);
        dx = J(x)\fx;
        x = x - dx;
        ea=max(abs(dx./x));
        if ea <= es
            break
        end
    end
    if iter == maxit
        warning(['Relative error criterion not satified. Please increas'...
                 'e the maximum allowable number of iterations or reduc'...
                 'e the desired relative error.'])
    end
end