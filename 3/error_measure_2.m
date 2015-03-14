function [ e ] = error_measure_2( estimation, truth )
% error_measure_2 - Compute parameter estimation error
%   error = [error_in_mean error_in_covariance]
%
% Where:
%   error_in_mean = ||estimation_mean - truth_mean|| / sqrt(2)
%   error_in_covariance = ||estimation_cov - truth_cov|| / sqrt(3)
%
    m_distance = estimation(1:2) - truth(1:2);
    P_distance = estimation(3:5) - truth(3:5);
    
    e = [
        sqrt( m_distance'*m_distance ) / sqrt(2) ...
        sqrt( P_distance'*P_distance ) / sqrt(3)
    ];
end

