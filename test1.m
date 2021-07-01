clc; clear; close all;
x = -5:0.01:5;
y = -normpdf(x) .* sin(10 * x);
plot(x, y, 'r:', 'linewidth', 4)