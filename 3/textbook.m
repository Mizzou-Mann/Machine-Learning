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

%% 1. b
x = 2;
theta = linspace(2, 5);
y = theta .* exp(-theta * x);

figure;
plot(theta, y);