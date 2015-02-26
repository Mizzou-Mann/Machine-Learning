%
% CS7720 Spring 2015
% Introduction to Machine Learning and Pattern Recognition
% University of Missouri-Columbia
%
% Author: Chanmann Lim
% email: cl9p8@mail.missouri.edu
%
% Homework Assignment 2
% Problem 4
%
clc; clear; close all;
dataset1 = load('2DGaussianDataset1.txt');
dataset2 = load('2DGaussianDataset2.txt');

%
% Part I
%

%
% c - classify dataset1 with map1
%
[w1, w2, gxs] = map1(dataset1);
disp('w1 = '); disp(w1);
disp('w2 = '); disp(w2);

%
% d - plot data sample and decision boundary
%
x = -3:2;
y = -3/2*x + 5/4;
figure;
plot(w1(:,1), w1(:,2), '.r'); hold on;
plot(w2(:,1), w2(:,2), 'ok'); hold on;
plot(x, y); hold off;
legend('w1', 'w2', 'decision boundary');
title('Dataset1');

%
% e - plot g(x_n)
%
figure;
plot(gxs);