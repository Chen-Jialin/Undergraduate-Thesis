clc; clear; close all;
h = 6.63e-34;% 普朗克常数
c = 3e8;% 光速
e = 1.6e-19;% 元电荷
file_path = [pwd, '\'];% 文件路径
% file = [file_path, 'FT2D_LTS248.87_ave1600_Prf10_2048_ 401_2021-05-30-16-30-02.raw'];
% 时延 25 fs
% file = [file_path, 'FT2D_LTS247.36625_ave1600_Prf10_2048_ 401_2021-05-30-16-10-26.raw'];
% 时延 1 ps
file = [file_path, 'FT2D_LTS247.22_ave1600_Prf10_2048_ 401_2021-05-30-16-15-08.raw'];
file_background = [file_path, 'FT2D_LTS247.52_ave1600_Prf10_2048_ 401_2021-05-30-16-19-55.raw'];
% 时延 10 ps
% file = [file_path, 'FT2D_LTS245.87_ave1600_Prf10_2048_ 401_2021-05-30-16-25-12.raw'];
% file_background = [file_path, 'FT2D_LTS248.87_ave1600_Prf10_2048_ 401_2021-05-30-16-30-02.raw'];
% 时延 100 ps
% file = [file_path, 'FT2D_LTS232.37_ave1600_Prf10_2048_ 401_2021-05-30-16-34-39.raw'];
% file_background = [file_path, 'FT2D_LTS252.37_ave1600_Prf10_2048_ 401_2021-05-30-16-39-34.raw'];

fid = fopen(file);% 文件 ID
data = fread(fid, [2048,801], '*double');% 读取数据
fclose(fid);% 关闭文件
probe_wavelength = data(:, 1);% probe 波长（nm）
probe_freq = c ./ (probe_wavelength * 1e-9);% probe 频率
probe_freq = probe_freq(3:2046);
pump_freq = linspace(-1 / 3.5e-15 / 2, 0, 200) + 2 / 3.5e-15;% pump 频率
probe_energy = h * probe_freq / e;% probe 能量（eV）
pump_energy = h * pump_freq / e;% pump 能量（eV）
data = data(3:2046, 202:401)';

fid = fopen(file_background);
background = fread(fid, [2048,801], '*double');
fclose(fid);
background = background(3:2046, 202:401)';

data = data - background;% 扣除散射光背底
t = tiledlayout(1,1);
ax1 = axes(t);
imagesc(probe_energy, pump_energy, data, [-0.1, 0.1])
colormap(jet(255))
ax1.DataAspectRatio = [1, 1, 1];% axis equal
hcb = colorbar('location', 'eastoutside');
colorTitleHandle = get(hcb, 'Title');
set(colorTitleHandle, 'String', 'Intensity / a.u.');
set(colorTitleHandle, 'Fontsize', 14);
hold on
ax1.FontSize = 14;
ax1.XLabel.String = 'Probe energy / eV';
ax1.YLabel.String = 'Pump energy / eV';
ax1.YDir = 'normal';
% ax1.XLim(1) = 0;
% ax1.YLim(1) = 0;
x = [1.5, 2.6];
y = [1.5, 2.6];
plot(x, y, 'k-', 'linewidth', 2)
ax2 = axes(t);
ax2.FontSize = 14;
ax2.XLabel.String = 'Probe wavelength / nm';
ax2.YLabel.String = 'Pump wavelength / nm';
ax2.YLabel.VerticalAlignment = 'bottom';
ax2.YLabel.Rotation = -90;
ax2.XAxisLocation = 'top';
ax2.XAxis.Direction = 'normal';
ax2.DataAspectRatio = [1, 1, 1];% axis equal
ax2.XLim = ax1.XLim;
ax2.YLim = ax1.YLim;
ax2.XTickLabel = round(h * c ./ (ax2.XTick * 1.6e-19) * 1e9);
ax2.YTickLabel = round(h * c ./ (ax2.YTick * 1.6e-19) * 1e9);
ax2.YAxisLocation = 'right';
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
