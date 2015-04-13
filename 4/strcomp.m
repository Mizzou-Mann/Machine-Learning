function [ y ] = strcomp( x, str )
% strcomp - Compare each row of 'x' with 'str'
%   Return 1 for the rows that equal to 'str' and 0 otherwise

    [r, c] = size(x);
    
    y = zeros(r, 1);
    for k=1:r
        y(k) = sum(x(k,:) == str);
    end
    y = y == c;
end