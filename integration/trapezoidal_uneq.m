function I = trapezoidal_uneq(x,y)
    % trapezoidal_uneq: unequal spaced trapezoidal rule quadrature
    % I = trapuneq(x,y):
    % Applies the trapezoidal rule to determine the integral for n data
    % points (x, y) where x and y must be of the same length and x must be
    % monotonically ascending
    % input:
    %   x = vector of independent variables
    %   y = vector of dependent variables
    % output:
    %   I = integral estimate
    if any(diff(x) < 0)
        error('x not monotonically ascending')
    end
    n = length(x);
    if length(y)~=n
        error('x and y must have equal lengths')
    end
    s = 0;
    for k = 1:n-1
        s = s + (x(k+1)-x(k))*(y(k)+y(k+1))/2;
    end
    I = s;