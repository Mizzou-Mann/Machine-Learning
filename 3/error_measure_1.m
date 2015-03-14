function [ e ] = error_measure_1( estimation, truth )
% error_measure_1 - Compute parameter estimation error
%   Where the error is L2-norm of the distance 
%   between the estimation and the truth.
%
%   e = ||estimation - truth||
%
    distance = estimation - truth;
    e = sqrt( distance'*distance );
end

