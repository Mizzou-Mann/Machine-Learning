%
% CS7720 Spring 2015
% Introduction to Machine Learning and Pattern Recognition
% University of Missouri-Columbia
%
% Author: Chanmann Lim
% email: cl9p8@mail.missouri.edu
%
% Homework Assignment 4
%
clc; clear; close all;

%% Load iris data
setosa     = 'setosa    ';
versicolor = 'versicolor';
virginica  = 'virginica ';

[x1, x2, x3, x4, y] = textread('iris.data', '%f,%f,%f,%f,Iris-%s');

X = [x1 x2 x3 x4];
y = char(y);

X_given_setosa = X(strcomp(y, setosa), :);
X_pca_given_versicolor = X(strcomp(y, versicolor), :);
X_given_virginica = X(strcomp(y, virginica), :);

[X_given_setosa_training, X_given_setosa_test] = split(X_given_setosa);
[X_given_versicolor_training, X_given_versicolor_test] = split(X_pca_given_versicolor);
[X_given_virginica_training, X_given_virginica_test] = split(X_given_virginica);

%% Problem 2
%
problem_2

%% Problem 3
%
problem_3

%% Problem 4
%
problem_4