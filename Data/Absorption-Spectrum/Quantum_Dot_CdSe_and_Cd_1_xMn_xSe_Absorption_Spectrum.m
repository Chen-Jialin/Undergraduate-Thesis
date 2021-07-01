clc; clear; close all;
data = readmatrix('Quantum-Dot-CdSe-and-Cd_{1-x}Mn_xSe-Absorption-Spectrum.csv');
h = 6.63e-34;% 普朗克常数
c = 3e8;% 光速
% l = ;% 样品厚度
% C = ;% 样品物质的量浓度
wavelength = data(:, 1);% 波长 / nm
% 吸光度
absorbance_CdSe = data(:, 2);
absorbance_Cd_1_xMn_xSe = data(:, 4);
% 吸收率
% absorption_rate_CdSe = exp(-absorbance_CdSe); 
% absorption_rate_Cd_1_xMn_xSe = exp(-absorbance_Cd_1_xMn_xSe);
% 摩尔吸光系数
% varepsilon_CdSe = absorption_rate_CdSe / l / C;
% varepsilon_Cd_1_xMn_xSe = absorption_rate_Cd_1_xMn_xSe / 1 / C;
figure(1)
t = tiledlayout(1,1);
ax1 = axes(t);
plot(ax1, wavelength, absorbance_CdSe, 'k-', 'linewidth', 2)
ax1.FontSize = 14;
ax1.XLabel.String = 'Wavelength / nm';
ax1.YLabel.String = 'Absorbance';
ax1.XAxisLocation = 'top';
ax1.XAxis.Direction = 'reverse';
ax1.YLim = [0, 2.8];
x = [686, 646, 613, 560, 523];
color = {'k', [0.6350 0.0780 0.1840], [0.9290 0.6940 0.1250], [0.4660 0.6740 0.1880], [0 0.4470 0.7410]};
transition_name = {'1S''_{3/2}→1S''(e)', '1S_{3/2}→1S(e)', '2S_{3/2}→1S(e)', '1P_{3/2}→1P(e)', '2S_{1/2}→1S(e)'};
for i = 1:length(x)
    eval(['L', num2str(i), '= xline(x(i), ''--'', [num2str(x(i)), '' nm, '', num2str(round(h * c / (x(i) * 1e-9) / 1.6e-19,2)), '' eV''], ''LabelVerticalAlignment'', ''middle'', ''LabelHorizontalAlignment'', ''center'', ''color'', color{i}, ''fontsize'', 10, ''DisplayName'', transition_name{i});'])
end

ax2 = axes(t);
% 通过局部平均平滑化含噪数据
absorbance_CdSe = smoothdata(absorbance_CdSe, 'movmean', 9);
% 非均匀离散数据点数值微分，精度~O(x^3)
absorbance_CdSe_2nd_derivative = 2 * (absorbance_CdSe(3:end) .* (wavelength(2:end - 1) - wavelength(1:end - 2)) + absorbance_CdSe(1:end - 2) .* (wavelength(3:end) - wavelength(2:end - 1)) - absorbance_CdSe(2:end - 1) .* (wavelength(3:end) - wavelength(1:end - 2))) ./...
    ((wavelength(3:end) - wavelength(2:end - 1)) .* (wavelength(2:end - 1) - wavelength(1:end - 2)).^2 + (wavelength(2:end - 1) - wavelength(1:end - 2)) .* (wavelength(3:end) - wavelength(2:end - 1)).^2);
plot(wavelength(2:end - 1), absorbance_CdSe_2nd_derivative, '-', 'linewidth', 1, 'color', [.5 .5 .5])
yline(0, '--')
ax2.XLabel.String = 'Energy / eV';
ax2.FontSize = 14;
ax2.XAxisLocation = 'bottom';
ax2.XLim = ax1.XLim;
ax2.XDir = 'reverse';
ax2.XTickLabel = round(h * c ./ (ax2.XTick * 1e-9) / 1.6e-19, 2);
ax2.YLim = [-3e-3, .5e-3];
ax2.YLabel.String = '2nd order derivative of absorbance';
ax2.YLabel.VerticalAlignment = 'bottom';
ax2.YLabel.Rotation = -90;
ax2.YAxisLocation = 'right';
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
legend([L1, L2, L3, L4, L5], 'fontsize', 10, 'location', 'southwest')
annotation('arrow', [.43, .53], [.68, .68])
annotation('arrow', [.54, .44], [.26, .26])

figure(2)
t = tiledlayout(1,1);
ax1 = axes(t);
plot(ax1, wavelength, absorbance_Cd_1_xMn_xSe, 'k-', 'linewidth', 2)
ax1.FontSize = 14;
ax1.XLabel.String = 'Wavelength / nm';
ax1.YLabel.String = 'Absorbance';
ax1.XAxisLocation = 'top';
ax1.XAxis.Direction = 'reverse';
ax1.YLim = [0, 2.8];
x = [522, 434];
color = {[0.6350 0.0780 0.1840], [0 0.4470 0.7410]};
transition_name = {'1S_{3/2}→1S(e)', '1P_{3/2}→1P(e)'};
for i = 1:length(x)
    eval(['L', num2str(i), '= xline(x(i), ''--'', [num2str(x(i)), '' nm, '', num2str(round(h * c / (x(i) * 1e-9) / 1.6e-19,2)), '' eV''], ''LabelVerticalAlignment'', ''middle'', ''LabelHorizontalAlignment'', ''center'', ''color'', color{i}, ''fontsize'', 10, ''DisplayName'', transition_name{i});'])
end

ax2 = axes(t);
% 通过局部平均平滑化含噪数据
absorbance_Cd_1_xMn_xSe = smoothdata(absorbance_Cd_1_xMn_xSe, 'movmean', 9);
% 非均匀离散数据点数值微分，精度~O(x^3)
absorbance_Cd_1_zMn_xSe_2nd_derivative = 2 * (absorbance_Cd_1_xMn_xSe(3:end) .* (wavelength(2:end - 1) - wavelength(1:end - 2)) + absorbance_Cd_1_xMn_xSe(1:end - 2) .* (wavelength(3:end) - wavelength(2:end - 1)) - absorbance_Cd_1_xMn_xSe(2:end - 1) .* (wavelength(3:end) - wavelength(1:end - 2))) ./...
    ((wavelength(3:end) - wavelength(2:end - 1)) .* (wavelength(2:end - 1) - wavelength(1:end - 2)).^2 + (wavelength(2:end - 1) - wavelength(1:end - 2)) .* (wavelength(3:end) - wavelength(2:end - 1)).^2);
plot(wavelength(2:end - 1), absorbance_Cd_1_zMn_xSe_2nd_derivative, 'linewidth', 1, 'color', [.5, .5, .5])
yline(0, '--')
ax2.XLabel.String = 'Energy / eV';
ax2.FontSize = 14;
ax2.XAxisLocation = 'bottom';
ax2.XLim = ax1.XLim;
ax2.XDir = 'reverse';
ax2.XTickLabel = round(h * c ./ (ax2.XTick * 1e-9) / 1.6e-19, 2);
ax2.YLim = [-3e-3, .5e-3];
ax2.YLabel.String = '2nd order derivative of absorbance';
ax2.YLabel.VerticalAlignment = 'bottom';
ax2.YLabel.Rotation = -90;
ax2.YAxisLocation = 'right';
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
legend([L1, L2], 'fontsize', 12, 'location', 'southwest')
annotation('arrow', [.66, .76], [.68, .68])
annotation('arrow', [.58, .48], [.2, .2])
