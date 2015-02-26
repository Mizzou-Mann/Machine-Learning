function [ classification, gxs ] = map1( dataset )
% Mininum error classifier for 2-D Gaussian with
%   Mean:
%       u1 = [1; 3]
%       u2 = [-2; 1]
%
%   Covariance:
%        C1 = C2 = C = cI
%
%   where c = 1.21 and I = identity matrix
%
% Input:    
%   dataset - dataset to be classified
%
% Output:   
%   classification - classification of the data sample. 
%                    : 1 for w1 and 0 for w2
%   gxs - value g(x) for all data sample.

    u1 = [1; 3]; u2 = [-2; 1];
    c = 1.21;
    w = 1/c * (u1 - u2);
    x0 = 1/2 * (u1 + u2);

    gxs = [];
    % NOTE: linear algebra can replace "for loop" here
    %       see ENHANCED section below
    for i=1:size(dataset, 1)
        x = dataset(i, :)';
        g = w' * (x - x0);
        gxs(i) = g;
    end
    
    classification = gxs > 0;
%     a1 = dataset(classification == 1, :);
%     a2 = dataset(classification == 0, :);
end

% ENHANCED:
%
%     scaled_x0 = x0 * ones(1, size(dataset, 1));
%     G = w' * (dataset' - scaled_x0);
%     categories = G > 0;

