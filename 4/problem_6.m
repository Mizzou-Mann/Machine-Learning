% Initialization
clc; clear all; close all;

% Load data
SalmonLightness = load('SalmonLightness.dat');
SeabassLightness = load('SeabassLightness.dat');

Total = length(SalmonLightness) + length(SeabassLightness);
P_salmon = length(SalmonLightness) / Total;
P_seabass = length(SeabassLightness) / Total;

H = [0.8 0.2];
x_range = 0:0.1:12;

for h=H
    p_lightness_given_salmon = parzen_window(SalmonLightness, x_range, h);
    p_lightness_given_seabass = parzen_window(SeabassLightness, x_range, h);
    p_lightness = p_lightness_given_salmon * P_salmon + ...
        p_lightness_given_seabass * P_seabass;

    figure;
    plot(x_range, p_lightness_given_salmon, 'r'); hold on;
    plot(x_range, p_lightness_given_seabass, '--k');
    plot(x_range, p_lightness, '-.g'); hold off;
    legend('P(lightness|salmon)', 'P(lightness|seabass)', 'P(lightness)');
    title(['PDFs with h=', num2str(h)]);
end