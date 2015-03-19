%
% CS7720 Spring 2015
% Introduction to Machine Learning and Pattern Recognition
% University of Missouri-Columbia
%
% Author: Chanmann Lim
% email: cl9p8@mail.missouri.edu
%
% Homework Assignment 3
% Problem 4
%
clc; clear; close all;

%%
% Problem 3. Part I
%
%   dataset - GDdataMLE1 dataset
%   m - true mean
%   P - true covariance
dataset = load('GDdataMLE1.txt');
m = [1; -1];
P = [2 1; 1 2];

problem_3_report;

%%
% Problem 3. Part II
%
%   dataset - GDdataMLE2 dataset
%   m - true mean
%   P - true covariance
dataset = load('GDdataMLE2.txt');
m = [1; -1];
P = [2 -1.9; -1.9 2];

problem_3_report;

%%
% Problem 4
%
dataset = load('GDdataMLEMAP.txt');
sigma = sqrt(2);
mu_0 = 2.2;
sigma_0 = sqrt(0.25);

problem_4_report;

%%
% Problem 5
%
[x1, x2, x3, x4] = textread('iris.data', '%f,%f,%f,%f,%*s');

X = [x1 x2 x3 x4];
X_setosa = X(1:50, :);
X_versicolor = X(51:100, :);
X_virginica = X(101:150, :);

X_given_setosa_test = [X_setosa(1:10, :); X_setosa(41:50, :)];
X_given_versicolor_test = [X_versicolor(1:10, :); X_versicolor(41:50, :)];
X_given_virginica_test = [X_virginica(1:10, :); X_virginica(41:50, :)];
X_given_setosa_training = X_setosa(11:40, :);
X_given_versicolor_training = X_versicolor(11:40, :);
X_given_virginica_training = X_virginica(11:40, :);

[Mu_x, Sigma_x_full] = mle([X_given_setosa_training; X_given_versicolor_training; X_given_virginica_training]);
[Mu_x_given_setosa, Sigma_x_given_setosa_full] = mle(X_given_setosa_training);
[Mu_x_given_versicolor, Sigma_x_given_versicolor_full] = mle(X_given_versicolor_training);
[Mu_x_given_virginica, Sigma_x_given_virginica_full] = mle(X_given_virginica_training);

%
% Experiment 1
%
Sigma_x = diag(diag(Sigma_x_full));
Sigma_x_given_setosa = diag(diag(Sigma_x_given_setosa_full));
Sigma_x_given_versicolor = diag(diag(Sigma_x_given_versicolor_full));
Sigma_x_given_virginica = diag(diag(Sigma_x_given_virginica_full));

display('-------------- Prob. 5 - Experiment 1 --------------');
problem_5_report;

%
% Experiment 2
%
Sigma_x = Sigma_x_full;
Sigma_x_given_setosa = Sigma_x_given_setosa_full;
Sigma_x_given_versicolor = Sigma_x_given_versicolor_full;
Sigma_x_given_virginica = Sigma_x_given_virginica_full;

display('-------------- Prob. 5 - Experiment 2 --------------');
problem_5_report;