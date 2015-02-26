function [ g_0 ] = decision_boundary( w, x0, y )
% DECISION_BOUNDARY - Derive decision boundary of 2-D Gaussian
%   Use discriminant function g(x) variables w and x0 to determine the
%   decision boundary. g(x) = 0.
%
% Input:
%   w - w of g(x)
%   x0 - x0 of g(x)
%   y - y data
%
    % ratio of w
    r = w(2)/w(1);
    % g_0 = [x1, computed_x2]
    %   the computed_x2 is derived from g(x) = 0
    g_0 = [ x0(1) - r*(y - x0(2)), y ];
end
