function [ x_tilda ] = pca_approximation( x, W, x_bar )
% pca_approximation - PCA approximation of x given Eigenvector W

    [~, M] = size(W); % # of preserved dimensions
    distance = x - x_bar;
    x_tilda = zeros(size(x,1), 1);
    
    for i=1:M
        x_tilda = x_tilda + (W(:, i)' * distance) * W(:, i);
    end
    x_tilda = x_tilda + x_bar;
end

