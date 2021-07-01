clc; clear; close all;
h = 6.63e-34;% 普朗克常数
c = 3e8;% 光速
% 读取波长
data = load('WL_Spectrum-20210530.txt');
wavelength = data(3:end - 2, 1);
energy = h * c ./ (wavelength * 1e-9) / 1.6e-19;
probe_spectrum = data(3:end - 2, 2);
delay_location_zero = 247.37;% 零时延位置（mm）
file_path = [pwd, '\'];
delay_time_list = [1, 10, 100];
file_name_list = {'TA-Long_start247.52_incre_-0.0150_step_61_ave20_probe_800_adj_25_Prf10__ 184_2049_2021-05-30-15-46-45.raw',...
                  'TA-Long_start248.87_incre_-0.150_step_111_ave20_probe_800_adj_25_Prf10__ 334_2049_2021-05-30-15-53-02.raw',...
                  'TA-Long_start262.37_incre_-1.500_step_61_ave20_probe_800_adj_25_Prf10__ 184_2049_2021-05-30-15-57-25.raw'};
t = tiledlayout(1,1);
ax1 = axes(t);
for i = 1:length(file_name_list)
    file_name = file_name_list{i};
    fid = fopen([file_path, file_name_list{i}]);
    [head, tail] = regexp(file_name, '__ [\d+]+_');
    row_num = str2double(file_name(head + 3:tail - 1));
    data = fread(fid, [row_num, 2049], '*double');
    fclose(fid);
    % 正则表达式查找水平位移台开始位置，文件名中应包含类似“start248.3_”字样
    [head, tail] = regexp(file_name, 'start[\d+.]+_');
    delay_location_start = str2double(file_name(head + 5:tail - 1));
    % 正则表达式查找水平位移台移动步长，文件名中应包含类似“incre_-0.6000_”字样
    [head, tail] = regexp(file_name, 'incre_[-\d+.]+_');
    delay_location_step_size = str2double(file_name(head + 6:tail - 1));
    % 正则表达式查找水平位移台移动步数，文件名中应包含类似“step_3_”字样
    [head, tail] = regexp(file_name, 'step_[\d+]+_');
    delay_location_step_num = str2double(file_name(head + 5:tail - 1));
    % 水平位移台扫描过的位置
    delay_location = delay_location_start:delay_location_step_size:delay_location_start + (delay_location_step_num - 1) * delay_location_step_size;
    % 水平位移台位置对应 pump-probe 时延（ps）
    delay_time = (delay_location_zero - delay_location) * 1e-3 * 2 / c * 1e12;
    % 正则表达式查找射频功率(rf power, %)，文件名中应包含类似“Prf20_”字样
    [head, tail] = regexp(file_name, 'Prf\d+_');
    power = str2double(file_name(head + 3:tail - 1));

    data = data(end - delay_location_step_num + 1:end, 4:2047);
    data = data - mean(data(1:8, :));
    % 局部平均以平滑含噪数据
    % 关于 probe 能量
    window = 0.01;% 平均窗口（eV）
    window_half = window / 2;
    data_ave = zeros(size(data));
    for j = 1:length(energy)
        energy_j = energy(j);
        data_local_sum = data(:, j);
        data_col_num = 1;
        for k = (j - 1):-1:1
            if energy(k) < (energy_j + window_half)
                data_local_sum = data_local_sum + data(:, k);
                data_col_num = data_col_num + 1;
            else
                break
            end
        end
        for k = (j + 1):length(energy)
            if energy(k) > (energy_j - window_half)
                data_local_sum = data_local_sum + data(:, k);
                data_col_num = data_col_num + 1;
            else
                break
            end
        end
        data_ave(:, j) = data_local_sum / data_col_num;
    end
    eval(['L', num2str(i), ' = plot(wavelength, data_ave(abs(delay_time - delay_time_list(i)) < 0.01, :), ''linewidth'', 2);'])
    hold on
end
yline(0)
ax1.FontSize = 14;
ax1.XLabel.String = 'Wavelength / nm';
ax1.XAxisLocation = 'top';
ax1.XDir = 'reverse';
ax1.YLabel.String = '\Delta{}I / I';
ax1.YLim = [-0.0005, 0.001];
for i = 1:length(ax1.YTick)
    ax1.YTickLabel(i) = {[num2str(ax1.YTick(i) * 1000), '‰']};
end
ax2 = axes(t);
data = readmatrix('../../Absorption-Spectrum/Quantum-Dot-CdSe-and-Cd_{1-x}Mn_xSe-Absorption-Spectrum.csv');
L4 = plot(data(:, 1), data(:,2), 'k--', 'linewidth', 1);
x = [686, 646, 613, 560, 523];
color = {'k', [0.6350 0.0780 0.1840], [0.9290 0.6940 0.1250], [0.4660 0.6740 0.1880], [0 0.4470 0.7410]};
for i = 1:length(x)
    xline(x(i), '--', 'color', color{i})
end
ax2.FontSize = 14;
ax2.XDir = 'reverse';
ax2.XLim = ax1.XLim;
ax2.XLabel.String = 'Energy / eV';
ax2.XAxisLocation = 'bottom';
ax2.XTickLabel = round(h * c ./ (ax2.XTick * 1e-9) / 1.6e-19,2);
ax2.YAxisLocation = 'right';
ax2.YLabel.VerticalAlignment = 'bottom';
ax2.YLabel.String = 'Absorbance';
ax2.YLabel.Rotation = -90;
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
legend([L1, L2, L3, L4], 'TA @ T = 1 ps', 'TA @ T = 10 ps', 'TA @ T = 100 ps', 'CdSe', 'fontsize', 10, 'location', 'northwest')
