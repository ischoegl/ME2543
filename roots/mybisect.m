function [rt, e] = mybisect(func, xl, xu, maxit, re)
    % mybisect: root finding using the bisection method
    % [rt, e] = mybisect(func, xl, xu, maxit, re)
    % input:
    %   func: funtion
    %   xl, xu: lower and upper bounds
    %   maxit: maximum allowable iterations
    %   re: desired relative error
    % output:
    %   rt: real root
    %   e: upper bound of the relative error
    
    fl = func(xl);
    fu = func(xu);
    if fl * fu >= 0.
        error(['Function does not have values of opposite sign at t' ...
               'the endpoints of the interval.'])
    end
    xr = xl;
    for i = 1:maxit
        xold = xr;
        xr = 0.5 * (xl + xu);
        fr = func(xr);
        e = abs((xr - xold) / xr);
        fprintf('%3i %12.8f %12.8f\n', i, xr, e)
        if fl * fr < 0
            xu = xr;
        else
            xl = xr;
        end
        if fr == 0
            e = 0;
            break
        elseif e <= re
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