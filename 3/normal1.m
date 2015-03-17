function [ Y ] = normal1( X, mu, sigma )
% normal1 - compute normal (gassian) pdf for X
%   X is a column vector

    exp_power = -1/(2*sigma^2) * (X - mu).^2;
    Y = 1/(sqrt(2*pi)*sigma) * exp(exp_power);
end

