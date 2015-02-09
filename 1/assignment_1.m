%
% CS7720 Spring 2015
% Introduction to Machine Learning and Pattern Recognition
% University of Missouri-Columbia
%
% Author: Chanmann Lim
% email: cl9p8@mail.missouri.edu
%
% Homework Assignment 1
% Problem 4
%
clc; clear; close all;

salmon = load('SalmonLightness.dat');
seabass = load('SeabassLightness.dat');
xvalues = load('formathist.dat');

%
% 1 - Plot Salmon and Seabass histogram with the intervals of 
%     [(k-1)*0.5, k*0.5], with k = 1,...,20
%
% k_min = 1; k_max = 20;
% xvalues = (k_min-1)*0.5:0.5:k_max*0.5;

figure; hist(salmon, xvalues);
figure; hist(seabass, xvalues);

%
% 2 - Compute P(salmon) and P(seabass)
%
sample = length(salmon) + length(seabass);
P_salmon = length(salmon)/sample;
P_seabass = length(seabass)/sample;

disp(['P(salmon) = ' num2str(P_salmon), ...
 ' and P(seabass) = ' num2str(P_seabass)]);

%
% 3 - Plot conditional probability P(lightness|salmon) and
%     P(lightness|seabase) pmf
%
P_lightness_given_salmon = hist(salmon, xvalues)'/length(salmon);
P_lightness_given_seabass = hist(seabass, xvalues)'/length(seabass);

disp('P(lightness|salmon) = '); disp(P_lightness_given_salmon);
disp('P(lightness|seabass) = '); disp(P_lightness_given_seabass);

figure;
stem(xvalues, [P_lightness_given_salmon P_lightness_given_seabass]);
legend('Salmon', 'Seabass');

%
% 4 - Compute:
%     P(lightness<=5|salmon) and P(lightness<=8|salmon)
%     P(lightness>=5|sea_bass) and P(lightness>=2|sea_bass)
%
P_lightness_less_equal_5_given_salmon = sum(P_lightness_given_salmon(xvalues<=5));
P_lightness_less_equal_8_given_salmon = sum(P_lightness_given_salmon(xvalues<=8));

disp(['P(lightness<=5|salmon) = ' num2str(P_lightness_less_equal_5_given_salmon), ...
 ' and P(lightness<=8|salmon) = ' num2str(P_lightness_less_equal_8_given_salmon)]);

P_lightness_grater_equal_5_given_seabass = sum(P_lightness_given_seabass(xvalues>=5));
P_lightness_grater_equal_2_given_seabass = sum(P_lightness_given_seabass(xvalues>=2));

disp(['P(lightness>=5|seabass) = ' num2str(P_lightness_grater_equal_5_given_seabass), ...
 ' and P(lightness>=2|seabass) = ' num2str(P_lightness_grater_equal_2_given_seabass)]);

%
% 5 - Plot the evidence pmf P(lightness)
%
P_lightness = P_lightness_given_salmon * P_salmon + P_lightness_given_seabass * P_seabass;
disp('P(lightness) = '); disp(P_lightness);
figure; stem(xvalues, P_lightness);

%
% 6 - Plot posterior probabilities
%
P_salmon_given_lightness = P_lightness_given_salmon * P_salmon ./ P_lightness;
P_seabass_given_lightness = P_lightness_given_seabass * P_seabass ./ P_lightness;

disp('P(salmon|lightness)'); disp(P_salmon_given_lightness);
disp('P(seabass|lightness)'); disp(P_seabass_given_lightness);

figure;
stem(xvalues, [P_salmon_given_lightness P_seabass_given_lightness]);
legend('Salmon', 'Seabass');