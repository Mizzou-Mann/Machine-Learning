% Examples for making plots

clear all; close all; clc;

x=0:0.1:10; % x
y1=sin(x); % y1
y2=cos(x); % y2

% plotting two(or more) curves into one figure
figure; % create a new(blank) figure
plot(x,y1); % the first curve
hold on; % hold the first curve in the figure
plot(x,y2); % the second curve

% alternative way of plotting two(or more) curves into one figure
figure; % create a new(blank) figure
plot(x,y1,x,y2); % the curves
% including legends for curves
legend('x1','x2');

% plotting two(or more) curves seperately
figure; % create a new(blank) figure
plot(x,y1); % the first curve
figure; % create a new(blank) figure
plot(x,y2); % the second curve

% define line style, line color, line width, axis ranges, font size, axis ticks, axis labels, title.
figure;
plot(x,y1,x,y2,'linestyle','--','color','red','linewidth',3); % red dashed line with the width 3
set(gca,'fontsize',15,'XTick',0:pi:3*pi,'XTickLabel',{'0','pi','2pi','3pi'}); % XTick, its label, and its fontsize
grid on; % turn on the grid based on predefined x and y ticks
axis([0 12 -1.2 1.2]); % axis range ([xmin xmax ymin ymax])
xlabel('x','fontsize',25); % Xlabel and its font size
ylabel('y_1','fontsize',25); % Ylabel and its font size
title('sin(x)','fontsize',30); % title for the figure and its font size

% Note: Similar configurations can be used on other plotting functions
% such as: plot3, plotyy, semilogx, semilogy, loglog, bar, stem, scatter,
% scatter3, etc.

% You can use the functions plot() or scatter() to plot 2-D data samples
% for example:
figure;
x=2*randn(1,100); % normal distributed 100 x values with standard deviation 2
y=3*randn(1,100); % normal distributed 100 y values with standard deviation 3
scatter(x,y,'marker','o','markeredgecolor','red','linewidth',2,'markerfacecolor','green','sizedata',30);
% marker type is circle, markeredge is red with width 2, markerface is
% green with size 30