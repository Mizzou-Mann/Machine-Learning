%
% Textbook: Pattern Classification Second Edition
% Authors: Duda, Hart and Stork
%
%   Chapter 3 Problems
%

%% 1. a
x = linspace(0, 10);
theta = 1;
y = theta .* exp(-theta * x);

figure;
plot(x, y);
xlabel('x'); ylabel('p(x|\theta)');

%% 1. b
x = 2;
theta = linspace(0, 5);
y = theta .* exp(-theta * x);

figure;
plot(theta, y);
xlabel('\theta'); ylabel('p(x|\theta)');