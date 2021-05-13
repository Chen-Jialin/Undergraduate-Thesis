clc; clear; close all;
data = readmatrix('Quantum-Dot-CdSe-and-Cd_{1-x}Mn_xSe-Absorption-Spectrum.csv');
h = 6.63e-34;% 普朗克常数
c = 3e8;% 光速
% l = ;% 样品厚度
% C = ;% 样品物质的量浓度
wavelength = data(:, 1);% 波长 / nm
energy = h * c ./ (wavelength * 1e-9) / 1.6e-19;
% 吸收度 
absorbance_CdSe = data(:, 2);
absorbance_Cd_1_xMn_xSe = data(:, 4);
% 吸收率
% absorption_rate_CdSe = exp(-absorbance_CdSe); 
% absorption_rate_Cd_1_xMn_xSe = exp(-absorbance_Cd_1_xMn_xSe);
% 摩尔吸光系数
% varepsilon_CdSe = absorption_rate_CdSe / l / C;
% varepsilon_Cd_1_xMn_xSe = absorption_rate_Cd_1_xMn_xSe / 1 / C;
t = tiledlayout(1,1);
ax1 = axes(t);
L1 = plot(ax1, energy, absorbance_CdSe, 'linewidth', 2);
hold on
L2 = plot(ax1, energy, absorbance_Cd_1_xMn_xSe, 'linewidth', 2);
ax1.XLabel.String = 'Energy / eV';
ax1.YLabel.String = 'Absorbance';
ax1.FontSize = 14;
ax1.XLim = [min(energy), max(energy)];
ax2 = axes(t);
ax2.XLabel.String = 'Wavelength / nm';
ax2.FontSize = 14;
ax2.XAxisLocation = 'top';
ax2.XLim = [min(energy), max(energy)];
ax2.XTickLabel = round(h * c ./ (ax2.XTick * 1.6e-19) * 1e9);
ax2.YAxisLocation = 'right';
ax2.YTick = [];
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
legend([L1, L2], 'CdSe', 'Cd_{1-x}Mn_xSe', 'fontsize', 14, 'location', 'northwest')