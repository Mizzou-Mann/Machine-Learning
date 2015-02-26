function report(U, C, dataset)
% Produce report
% Input:
%   dataset - data sample

    [classification, gxs] = MAP(U, C, dataset);

    %
    % c - classify dataset with minimum error classifier (MAP)
    %
    disp('Alpha 1 = '); disp(dataset(classification == 1, :));
    disp('Alpha 2 = '); disp(dataset(classification == 0, :));

    %
    % d - plot data sample and decision boundary
    %
    x = -3:2;
    y = -3/2*x + 5/4;
    figure;
    w1 = dataset(1:25, :);
    w2 = dataset(26:end, :);
    plot(w1(:,1), w1(:,2), '.r'); hold on;
    plot(w2(:,1), w2(:,2), 'ok'); hold on;
    plot(x, y); hold off;
    legend('w1', 'w2', 'decision boundary');

    %
    % e - plot g(x_n)
    %
    figure;
    plot(gxs);

    %
    % f - compute classification error rate
    %
    w1_misclassified = 25 - sum(classification(1:25));
    w2_misclassified = sum(classification(26:end));
    error_rate = (w1_misclassified + w2_misclassified) / size(dataset, 1) * 100;
    disp(['The classification error rate = ', num2str(error_rate), '%.']);
end