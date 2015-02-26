function [ classification, g_Xn, g_0 ] = classify( w, x0, dataset )
% CLASSIFY - Classify the dataset
%   Perform classification g(x) = w' * (x - x0)
%
% Input:
%   w - w vector in g(x) function
%   x0 - x0
%
% Output:
%   classification - 1 for class 1 and 0 for class 2. 
%   g_Xn - value g(x) for all data samples.
%   g_0 - decision boundary
%
    % Auto-tune decision boundary to x2 bound
    [~, lower] = min(dataset(:, 2));
    [~, upper] = max(dataset(:, 2));
    g_0 = decision_boundary(w, x0, dataset([lower upper], 1));

    % NOTE: linear algebra can replace "for loop" here
    %       see ENHANCED section below
    g_Xn = [];
    for i=1:size(dataset, 1)
        x = dataset(i, :)';
        g = w' * (x - x0);
        g_Xn(i) = g;
    end
    
    classification = g_Xn > 0;
end

% ENHANCED:
%
%     scaled_x0 = x0 * ones(1, size(dataset, 1));
%     G = w' * (dataset' - scaled_x0);
%     categories = G > 0;