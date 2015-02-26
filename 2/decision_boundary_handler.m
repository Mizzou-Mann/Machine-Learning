function [ handler ] = decision_boundary_handler( w, x0 )
%DECISION_BOUNDARY Summary of this function goes here
%   Detailed explanation goes here

    r = w(1)/w(2); % ratio of w
    handler = @(x) x0(2) - r*(x(1) - x0(1));
end

