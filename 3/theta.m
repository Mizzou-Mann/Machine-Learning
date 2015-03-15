function [ theta ] = theta( m, P )
% theta - Construct theta vector given mean 'm' and covariance 'P'
% 
% Output:
%   theta = [m1 m2 var1 cov(1,2) var2]'

    theta = [m; P([1 2 4])'];
end

