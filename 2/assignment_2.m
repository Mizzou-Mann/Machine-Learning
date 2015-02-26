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
% clc; clear; close all;
dataset1 = load('2DGaussianDataset1.txt');
dataset2 = load('2DGaussianDataset2.txt');

%
% Part I
%

%
% c - classify dataset1 with map1
%
classification_1 = map1(dataset1);