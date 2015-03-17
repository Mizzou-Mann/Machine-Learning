%
% Report for problem 4
%   Mu = [mu_mle, mu_map]

Mu = zeros(20, 2);
sigma_n  = zeros(20, 1);
for k=1:20
    samples = dataset(1:2*(2*k-1));
    Mu(k, 1) = mle(samples);
    [Mu(k, 2), sigma_n(k)] = map(samples, sigma, mu_0, sigma_0);
end

% a
display(Mu);

% b
mu_truth = 2; 
Mu_error = abs(Mu - mu_truth);

figure;
plot(Mu_error(:,1), 'b'); hold on;
plot(Mu_error(:,2), 'g--'); hold off;
legend('MLE', 'MAP');
xlabel('k'); ylabel('estimation error');

% c
X = (-1:0.01:4)';
figure;
Y1 = normal1(X, Mu(1, 2), sigma_n(1));
Y10 = normal1(X, Mu(10, 2), sigma_n(10));
Y20 = normal1(X, Mu(20, 2), sigma_n(20));
plot(X, Y1, 'b'); hold on;
plot(X, Y10, 'g--');
plot(X, Y20, 'r:'); hold off;
legend('k=1', 'k=10', 'k=20');
xlabel('x'); ylabel('\mu \sim N(\mu_{N}, \sigma^{2}_{N})');