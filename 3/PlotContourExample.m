% Examples of plotting density function contours

clear all; close all; clc;
Mu=[0;0];
Sigma=[1,0;0,1];
[X,Y]=meshgrid(-4:0.1:4,-4:0.1:4); % X and Y arrays for 3-D plot (X, Y are both 81*81 matrices)
PDF=normal2(X,Y,Mu,Sigma); % Gaussian PDF value within the region -4<=x<=4 and -4<=y<=4 (PDF is also put in a 81*81 matrix)
figure;
plot3(X,Y,PDF); % 3-D plot
figure;
contour3(X,Y,PDF,100); % 3-D contour with 100 levels
figure;
contourf(X,Y,PDF,100); % 2-D contour (filled) with 100 levels
axis equal; % set the data aspect ratio to 1:1 while maintaining the window aspect ratio at the default value 3:4
figure;
contour(X,Y,PDF,100); % 2-D contour with 100 levels
axis equal; % set the data aspect ratio to 1:1 while maintaining the window aspect ratio at the default value 3:4
figure;
contour(X,Y,PDF,[0:0.01:0.1]); % 2-D contour at the levels of pdf = 0, 0.01, 0.02, ... , 0.1
axis equal; % set the data aspect ratio to 1:1 while maintaining the window aspect ratio at the default value 3:4
figure;
contour(X,Y,PDF,[0.03 0.03]); % 2-D contour at the level of pdf=0.03 (should repeat the level twice in a vector in order to distinguish from the n-level case)
axis equal; % set the data aspect ratio to 1:1 while maintaining the window aspect ratio at the default value 3:4
% Note: linestyle, line color, linewidth, axis ranges, fontsize, axis
% ticks, axis labels, title, etc. can be defined in the similar way we
% introduced in the plot example given in Homework 2