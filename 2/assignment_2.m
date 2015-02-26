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
u1 = [1; 3]; u2 = [-2; 1];
C = [1.21 0; 0 1.21];

%
% report c, d, e, f
%
% report([u1 u2], C, dataset1);

%
% Part II
%   report c, d, e, f
%
% report([u1 u2], C, dataset2);

%
% Part III
%
D = [1.21 .8; .8 1.21];
report([u1 u2], D, dataset2);

