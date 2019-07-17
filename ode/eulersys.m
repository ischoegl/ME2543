function [tp, yp] = eulersys(dydt, tspan, y0, h)
    % eulsys: Euler's method for a system of ODEs
    % [t,y] = eulsys(dydt,tspan,y0,h): integrates a system of ODEs with
    % Euler's method
    % input:
    %   dydt = name of the M-file that evaluates the ODEs
    %   tspan = [ti, tf]; initial and final times with output
    %   generated at interval of h, or
    %   = [t0 t1 ... tf]; specific times where solution output
    %   y0 = initial values of dependent variables
    %   h = step size
    % output:
    %   tp = vector of independent variable
    %   yp = vector of solution for dependent variables
    if any(diff(tspan) <= 0)
        error('tspan not ascending order')
    end
    n = length(tspan);
    ti = tspan(1);
    tf = tspan(n);
    if n == 2
        t = (ti:h:tf)';
        n = length(t);
    if t(n) < tf
        t(n+1) = tf;
        n = n + 1;
    end
    else
        t = tspan;
    end
    tt = ti;
    y(1,:) = y0;
    np = 1;
    tp(np) = tt;
    yp(np,:) = y(1,:);
    i=1;
    while(1)
        tend = t(np+1);
        hh = t(np+1) - t(np);
        if hh > h
            hh = h;
        end
        while(1)
            if tt + hh > tend
                hh = tend - tt;
            end
            phi = dydt(tt, y(i,:))';
            y(i+1,:) = y(i,:) + phi*hh;
            tt = tt+hh;
            i=i+1;
            if tt>= tend
                break
            end
        end
        np = np + 1;
        tp(np) = tt;
        yp(np,:) = y(i,:);
        if tt >= tf
            break
        end
    end