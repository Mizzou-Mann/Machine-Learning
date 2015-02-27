function report(U, C, dataset)
% REPORT - produce reports
% Input:
%   U - mean vector matrix
%   C - Covariance matrix
%   dataset - data sample
%   
    [w, x0] = MAP(U, C);
    [classification, g_Xn, g_0] = classify(w, x0, dataset);

    %
    % c - classify dataset with minimum error classifier (MAP)
    %
    disp('Classification = '); disp([dataset classification']);

    %
    % d - plot data sample and decision boundary
    %
    figure;
    w1 = dataset(1:25, :);
    w2 = dataset(26:end, :);
    scatter(w1(:,1), w1(:,2), '*r'); hold on;
    scatter(w2(:,1), w2(:,2), 'ok'); hold on;
    plot(g_0(:,1), g_0(:,2)); hold off;
    legend('w1', 'w2', 'decision boundary');

    %
    % e - plot g(x_n)
    %
    figure;
    plot(g_Xn(1:25), '*r'); hold on;
    plot(g_Xn(26:end), 'ok'); hold on;
    x = 0:25; y = 0*x;
    plot(x, y); hold off;
    legend('w1', 'w2', 'y = 0');

    %
    % f - compute classification error rate
    %
    w1_misclassified = 25 - sum(classification(1:25));
    w2_misclassified = sum(classification(26:end));
    error_rate = (w1_misclassified + w2_misclassified) / size(dataset, 1) * 100;
    disp(['The classification error rate = ', num2str(error_rate), '%.']);
end