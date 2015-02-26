function [ categories ] = map1( dataset )
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
% Input:    dataset - dataset to be classified
% Output:   classes - output classification : 1 for class (w1) and 0 for class (w2)

    u1 = [1; 3]; u2 = [-2; 1];
    c = 1.21;
    w = 1/c * (u1 - u2);
    x0 = 1/2 * (u1 + u2);

    categories = [];
    for i=1:size(dataset, 1)
        x = dataset(i, :)';
        g = w' * (x - x0);
        categories(i) = g > 0;
    end

%     scaled_x0 = x0 * ones(1, size(dataset, 1));
%     G = w' * (dataset' - scaled_x0);
%     categories = G > 0;
end

