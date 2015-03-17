%
% Report for problem 3
%   m - mean
%   P - covariance

% a
[m_of_10_data_samples, P_of_10_data_samples] = mle(dataset(1:10, :));
display(m_of_10_data_samples);
display(P_of_10_data_samples);

% b
first_100_data_samples = dataset(1:100, :);
[m_of_100_data_samples, P_of_100_data_samples] = mle(first_100_data_samples);
display(m_of_100_data_samples);
display(P_of_100_data_samples);

% c
[m_of_1000_data_samples, P_of_1000_data_samples] = mle(dataset(1:1000, :));
display(m_of_1000_data_samples);
display(P_of_1000_data_samples);

% d
[m_of_10000_data_samples, P_of_10000_data_samples] = mle(dataset(1:10000, :));
display(m_of_10000_data_samples);
display(P_of_10000_data_samples);

% e
theta_true = theta(m, P);
theta_of_10_data_samples = theta(m_of_10_data_samples, P_of_10_data_samples);
theta_of_100_data_samples = theta(m_of_100_data_samples, P_of_100_data_samples);
theta_of_1000_data_samples = theta(m_of_1000_data_samples, P_of_1000_data_samples);
theta_of_10000_data_samples = theta(m_of_10000_data_samples, P_of_10000_data_samples);

error_1 = [
    error_measure_1(theta_of_10_data_samples, theta_true) 
    error_measure_1(theta_of_100_data_samples, theta_true) 
    error_measure_1(theta_of_1000_data_samples, theta_true) 
    error_measure_1(theta_of_10000_data_samples, theta_true)
];
display(error_1);

error_2 = [
    error_measure_2(theta_of_10_data_samples, theta_true) 
    error_measure_2(theta_of_100_data_samples, theta_true) 
    error_measure_2(theta_of_1000_data_samples, theta_true) 
    error_measure_2(theta_of_10000_data_samples, theta_true)
];
display(error_2);

% f
x1 = first_100_data_samples(:,1);
x2 = first_100_data_samples(:,2);

[X,Y]=meshgrid(-4:0.1:4,-4:0.1:4);
Pdf = normal2(X, Y, m_of_100_data_samples, P_of_100_data_samples);
levels = exp(-1) / ( 2*pi*sqrt( det(P_of_100_data_samples) ) );

figure;
plot(x1, x2, 'x'); hold on;
contour(X, Y, Pdf, [levels]);
axis equal;
