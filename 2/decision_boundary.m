function [ g_0 ] = decision_boundary( w, x0, x )
% DECISION_BOUNDARY - Derive decision boundary
%   Use discriminant function g(x) variables w and x0 to determine the
%   decision boundary. g(x) = 0.
%
% Input:
%   w - w of g(x)
%   x0 - x0 of g(x)
%   x - x data
%
    % ratio of w
    r = w(1)/w(2);
    % g_0 = [x1, computed_x2]
    %   the computed_x2 is derived from g(x) = 0
    g_0 = [ x, x0(2) - r*(x - x0(1)) ];
end
