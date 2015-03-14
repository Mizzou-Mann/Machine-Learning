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

% a
[m_of_10_data_samples, P_of_10_data_samples] = mle(dataset(1:10, :));
display(m_of_10_data_samples);
display(P_of_10_data_samples);

% b
[m_of_100_data_samples, P_of_100_data_samples] = mle(dataset(1:100, :));
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
error_1 = [
    error_measure_1(theta(m_of_10_data_samples, P_of_10_data_samples), theta_true) 
    error_measure_1(theta(m_of_100_data_samples, P_of_100_data_samples), theta_true) 
    error_measure_1(theta(m_of_1000_data_samples, P_of_1000_data_samples), theta_true) 
    error_measure_1(theta(m_of_10000_data_samples, P_of_10000_data_samples), theta_true)
];
display(error_1);

error_2 = [
    error_measure_2(theta(m_of_10_data_samples, P_of_10_data_samples), theta_true) 
    error_measure_2(theta(m_of_100_data_samples, P_of_100_data_samples), theta_true) 
    error_measure_2(theta(m_of_1000_data_samples, P_of_1000_data_samples), theta_true) 
    error_measure_2(theta(m_of_10000_data_samples, P_of_10000_data_samples), theta_true)
];
display(error_2);