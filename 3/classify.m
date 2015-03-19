function [ c ] = classify( X, Theta_1, Theta_2, Theta_3 )
% classify - Classify X given Theta {1 2 and 3}
%   by comparing the value of discriminant function g(x)
%   for each parameter theta.
%
% Return:
%   c - classification vector
%
% where value of
%   c = 1 (Iris-setosa)
%   c = 2 (Iris-versicolor)
%   c = 3 (Iris-virginica)
%

    X_size = size(X, 1);
    c = zeros(X_size, 1);
    
    for k=1:X_size
        x = X(k, :)';
        [~, c(k,:)] = max([
            g_mle(x, Theta_1(:, 1), Theta_1(:, 2:5)) ...
            g_mle(x, Theta_2(:, 1), Theta_2(:, 2:5)) ...
            g_mle(x, Theta_3(:, 1), Theta_3(:, 2:5)) ]);
    end
end

