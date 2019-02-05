function [rt, e] = mynewton(func, dfunc, xr, maxit, re)
    % mynewton: root finding using the newton-raphson method
    % [rt, e] = mynewton(func, dfunc, xr, maxit, re)
    % input:
    %   func: funtion
    %   dfunc: derivative of function
    %   xr: initial guess
    %   maxit: maximum allowable iterations
    %   re: desired relative error
    % output:
    %   rt: real root
    %   e: upper bound of the relative error
    
    for i = 1:maxit
        xold = xr;
        xr = xr - func(xr) / dfunc(xr);
        e = abs((xr - xold) / xr);
        fprintf('%3i %12.8f %12.8f\n', i, xr, e)
        if e <= re
            break
        end
    end
    if i == maxit
        warning(['Relative error criterion not satified. Please increas'...
               'e the maximum allowable number of iterations or reduce '...
               'the desired relative error.'])
    end
    rt = xr;
end