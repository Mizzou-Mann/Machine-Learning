function [ mu_n, sigma_n ] = map( dataset, sigma, mu_0, sigma_0 )
% map - Maximum a posteriori estimator for mean 
%       of 1-D Gaussian dataset
%
%   mu_n    : the estimated mean n
%   sigma_n : the estimated sigma n
%
    N = length(dataset);
    x_bar = mean(dataset);
    mu_numerator = N * sigma_0^2 * x_bar + sigma^2 * mu_0;
    mu_denominator = N * sigma_0^2 + sigma^2;
    var_numerator = sigma_0^2 * (sigma^2)/N;
    var_denominator = sigma_0^2 + (sigma^2)/N;
    
    mu_n = mu_numerator / mu_denominator;
    sigma_n = sqrt(var_numerator / var_denominator);
end

