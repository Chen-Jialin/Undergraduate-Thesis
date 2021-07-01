clc; clear; close all;
h = 6.63e-34;% 普朗克常数
c = 3e8;% 光速
e = 1.6e-19;% 元电荷
file_path = [pwd, '\'];% 文件路径
files = dir([file_path, '*.raw']);% 文件列表
for i = 1:length(files)
    file_name = files(i).name;% 文件名
    fid = fopen([file_path, file_name]);% 文件 ID
    data = fread(fid, [2048,801], '*double');% 读取数据
    fclose(fid);% 关闭文件
    probe_freq = c ./ (data(:, 1) * 1e-9);% probe 频率
    pump_freq = linspace(0, 1 / 3.5e-15 / 2, 200) + 1.5 / 3.5e-15;% pump 频率
    probe_energy = h * probe_freq / e;% probe 能量（eV）
    probe_energy = probe_energy;% 原始数据对角峰未过原点
    pump_energy = h * pump_freq / e;% pump 能量（eV）
    data = data(3:2046, 202:401)';
    disp(file_name)
    t = tiledlayout(1,1);
    ax1 = axes(t);
    % imshow(data, [-0.1,0.1], 'colormap', jet(255))
    imagesc(probe_energy, pump_energy, data, [-0.05, 0.05])
    colormap(jet(255))
    ax1.DataAspectRatio = [1, 1, 1];% axis equal
    hcb = colorbar('location', 'southoutside');
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
    ax2.XLim = ax1.XLim;
    ax2.YLim = ax1.YLim;
    ax2.XTickLabel = round(h * c ./ (ax2.XTick * 1.6e-19) * 1e9);
    ax2.YTickLabel = round(h * c ./ (ax2.YTick * 1.6e-19) * 1e9);
    ax2.YAxisLocation = 'right';
    ax2.Color = 'none';
    ax1.Box = 'off';
    ax2.Box = 'off';
end
