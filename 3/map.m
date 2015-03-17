function [ m ] = map( dataset, sigma, mu_0, sigma_0 )
% map - Maximum a posteriori estimator for mean 
%       of 1-D Gaussian dataset
%
%   m : the estimated mean
%
    N = length(dataset);
    x_bar = mean(dataset);
    numerator = N * sigma_0^2 * x_bar + sigma^2 * mu_0;
    denominator = N * sigma_0^2 + sigma^2;
    
    m = numerator / denominator;
end

