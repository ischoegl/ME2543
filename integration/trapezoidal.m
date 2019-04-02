function int = trapezoidal(func, a, b, n)
    % trap: composite trapezoidal rule quadrature
    % int = trap(func, a, b, n):
    % Composite trapezoidal rule
    % input:
    %   func = name of function to be integrated
    %   a, b = integration limits
    %   n = number of segments
    % output:
    %   I = integral estimate
    if ~(b>a)
        error('Upper bound must be greater than lower')
    end
    x = a;
    h = (b - a)/n;
    s = func(a);
    for i = 1:n-1
        x = x + h;
        s = s + 2 * func(x);
    end
    s = s + func(b);
    int = (b - a) * s / (2 * n);