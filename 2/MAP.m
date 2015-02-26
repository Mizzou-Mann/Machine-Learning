function [ w, x0 ] = MAP( U, C )
% MAP - Compute w and x0 values of g(x) minimum error classification
%   g(x) = w' * (x - x0)
%
% Input:
%   U - 2 mean vectors of the 2-D gaussian
%   C - Covariance of the 2-D gaussian (assume C1 = C2 = C)
%
% Output:   
%   w - w vector
%   x0 - x0 vector

    u1 = U(:, 1); u2 = U(:, 2);
    w = C \ (u1 - u2); % = inv(C) * (u1 - u2)
    x0 = 1/2 * (u1 + u2);
end
