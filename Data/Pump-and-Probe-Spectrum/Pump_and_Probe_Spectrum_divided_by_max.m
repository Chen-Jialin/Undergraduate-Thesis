clc; clear; close all;
h = 6.63e-34;% 普朗克常数
c = 3e8;% 光速
% data = load('CurrentSpectrum_Pump.txt');
data = load('Pump_Spectrum-20210530.txt');
data = data(3:end - 3,:);
data(:,2) = data(:,2) / max(data(:,2));
t = tiledlayout(1,1);
ax1 = axes(t);
L1 = plot(data(:,1), data(:,2), 'linewidth', 2);
hold on
% data = load('CurrentSpectrum_WL_through_sample.txt');
% data = load('WL-Spectrum-20210526.txt');
% data = load('WL-Spectrum-20210527.txt');
data = load('WL_Spectrum-20210530.txt');
data = data(3:end - 3,:);
data(:,2) = data(:,2) / max(data(:,2));
L2 = plot(data(:,1), data(:,2), 'linewidth', 2);
ax1.FontSize = 14;
ax1.XLabel.String = 'Wavelength / nm';
ax1.YLabel.String = 'Intensity / a.u.';
ax1.XAxisLocation = 'top';
ax1.XAxis.Direction = 'reverse';
ax1.XLim = [400, 810];
ax1.YLim = [0, 1.1];
annotation('arrow', [0.4, 0.3], [0.6, 0.6], 'color', [0 0.4470 0.7410])
annotation('arrow', [0.3, 0.2], [0.3, 0.3], 'color', [0.8500 0.3250 0.0980])
ax2 = axes(t);
data = readmatrix('../Absorption-Spectrum/Quantum-Dot-CdSe-and-Cd_{1-x}Mn_xSe-Absorption-Spectrum.csv');
L3 = plot(data(:,1), data(:,2), 'k--', 'linewidth', 1);
x = [686, 646, 613, 560, 523];
color = {'k', [0.6350 0.0780 0.1840], [0.9290 0.6940 0.1250], [0.4660 0.6740 0.1880], [0 0.4470 0.7410]};
for i = 1:length(x)
    xline(x(i), '--', 'color', color{i})
end
annotation('arrow', [0.75, 0.85], [0.5, 0.5], 'color', 'black')
ax2.FontSize = 14;
ax2.XLabel.String = 'Energy / ev';
ax2.YLabel.String = 'Absorbance';
ax2.YLabel.VerticalAlignment = 'bottom';
ax2.YLabel.Rotation = -90;
ax2.XAxisLocation = 'bottom';
ax2.XAxis.Direction = 'reverse';
ax2.XLim = ax1.XLim;
ax2.XTickLabel = round(h * c ./ (ax2.XTick * 1e-9) / 1.6e-19, 2);
ax2.YAxisLocation = 'right';
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
legend([L1, L2, L3], 'Pump', 'Probe', 'CdSe', 'fontsize', 12, 'location', 'northwest')
