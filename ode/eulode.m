function [t,y] = eulode(dydt, tspan, y0, h)
    % eulode: Euler ODE solver
    % [t,y] = eulode(dydt, tspan, y0, h):
    % uses Euler's method to integrate an ODE
    % input:
    %   dydt = name of the M−file that evaluates the ODE
    %   tspan = [ti, tf]
    %           ti and tf are initial and final values of the ind. variable
    %   y0 = initial value of dependent variable
    %   h = step size
    % output:
    %   t = vector of independent variable
    %   y = vector of solution for dependent variable
    ti = tspan(1);
    tf = tspan(2);
    if ~(tf>ti)
        error('upper limit must be greater than lower')
    end
    t = (ti:h:tf)';
    n = length(t);
    y = y0 * ones(n,1); % preallocate y to improve efficiency
    for i = 1:n-1 %implement Euler's method
      y(i+1) = y(i) + dydt(t(i),y(i))*(t(i+1)-t(i));
    end