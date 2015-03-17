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