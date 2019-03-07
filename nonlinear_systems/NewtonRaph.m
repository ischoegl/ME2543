function [x, fx] = NewtonRaph(func, J, x0, es, maxit)
    % Newton-Raphson root zeroes nonlinear systems
    % [x,fx] = NewtonRaph(func, J, x0, es, maxit):
    % uses the Newton-Raphson method to find the roots of a system of
    % nonlinear equations
    % input:
    %   func = name of function that returns f
    %   J = name of function that returns the Jacobian matrix
    %   x0 = initial guess
    %   es = desired percent relative error
    %   maxit = maximum allowable iterations
    % output:
    %   x = vector of roots
    %   fx = vector of functions evaluated at roots
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