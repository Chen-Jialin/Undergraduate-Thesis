clc; clear; close all;
h = 6.63e-34;% 普朗克常数
c = 3e8;% 光速
e = 1.6e-19;% 元电荷
file_path = [pwd, '\'];% 文件路径

t = tiledlayout(1,1);
ax1 = axes(t);
file_name_list = {'FT2D_LTS247.22_ave1600_Prf10_2048_ 401_2021-05-30-16-15-08.raw',...% 时延 1 ps
                  'FT2D_LTS245.87_ave1600_Prf10_2048_ 401_2021-05-30-16-25-12.raw',...% 时延 10 ps
                  'FT2D_LTS232.37_ave1600_Prf10_2048_ 401_2021-05-30-16-34-39.raw'};% 时延 100 ps
file_background_list = {'FT2D_LTS247.52_ave1600_Prf10_2048_ 401_2021-05-30-16-19-55.raw',...% 时延 1 ps
                        'FT2D_LTS248.87_ave1600_Prf10_2048_ 401_2021-05-30-16-30-02.raw',...% 时延 10 ps
                        'FT2D_LTS252.37_ave1600_Prf10_2048_ 401_2021-05-30-16-39-34.raw'};% 时延 100 ps
for i = 1:length(file_name_list)
    file = [file_path, file_name_list{i}];
    file_background = [file_path, file_background_list{i}];
    fid = fopen(file);% 文件 ID
    data = fread(fid, [2048,401], '*double');% 读取数据
    fclose(fid);% 关闭文件
    data = data(3:2046, :)';
    
    fid = fopen(file_background);
    background = fread(fid, [2048,401], '*double');
    fclose(fid);
    background = background(3:2046, :)';
    
    probe_wavelength = data(1, :);% probe 波长（nm）
    probe_freq = c ./ (probe_wavelength * 1e-9);% probe 频率
    probe_energy = h * probe_freq / e;% probe 能量（eV）
    pump_freq = linspace(-1 / 3.5e-15 / 2, 0, 200) + 2 / 3.5e-15;% pump 频率
    pump_energy = h * pump_freq / e;% pump 能量（eV）
    
    data = data(202:401, :) - background(202:401, :);% 扣除散射光背底
    % 局部平均以平滑含噪数据
    % 关于 probe 能量
    window = 0.01;% 平均窗口（eV）
    window_half = window / 2;
    data_ave = zeros(size(data));
    for j = 1:length(probe_energy)
        probe_energy_j = probe_energy(j);
        data_local_sum = data(:, j);
        data_col_num = 1;
        for k = (j - 1):-1:1
            if probe_energy(k) < (probe_energy_j + window_half)
                data_local_sum = data_local_sum + data(:, k);
                data_col_num = data_col_num + 1;
            else
                break
            end
        end
        for k = (j + 1):length(probe_energy)
            if probe_energy(k) > (probe_energy_j - window_half)
                data_local_sum = data_local_sum + data(:, k);
                data_col_num = data_col_num + 1;
            else
                break
            end
        end
        data_ave(:, j) = data_local_sum / data_col_num;
    end
    TA = sum(data_ave);% 对各 pump 频率积分，投影到 probe 谱上成为瞬态吸收谱
    eval(['L', num2str(i), ' = plot(probe_energy, TA, ''linewidth'', 2);'])
    hold on
%     plot(probe_energy, sum(data_ave(49:53,:)), '-.', 'linewidth', 1)
end
x = [686, 646, 613, 560, 523];
color = {'k', [0.6350 0.0780 0.1840], [0.9290 0.6940 0.1250], [0.4660 0.6740 0.1880], [0 0.4470 0.7410]};
for i = 1:length(x)
    xline(h * c / (x(i) * 1e-9) / 1.6e-19, '--', 'color', color{i})
end

yline(0)
ax1.FontSize = 14;
ax1.XLabel.String = 'Probe energy / eV';
ax1.YLabel.String = 'Transient intensity / a.u.';
ax1.XLim = [min(probe_energy), max(probe_energy)];
legend('T = 1 ps', 'T = 10 ps', 'T = 100 ps', 'fontsize', 14, 'location', 'northeast')
ax2 = axes(t);
data = readmatrix('../../Absorption-Spectrum/Quantum-Dot-CdSe-and-Cd_{1-x}Mn_xSe-Absorption-Spectrum.csv');
L4 = plot(h * c ./ (data(:,1) * 1.6e-19) * 1e9, data(:, 2), 'k--', 'linewidth', 1);
x = [686, 646, 613, 560, 523];
color = {'k', [0.6350 0.0780 0.1840], [0.9290 0.6940 0.1250], [0.4660 0.6740 0.1880], [0 0.4470 0.7410]};
for i = 1:length(x)
    xline(x(i), '--', [num2str(x(i))], 'color', color{i})
end
annotation('arrow', [0.75, 0.85], [0.5, 0.5], 'color', 'black')
ax2.FontSize = 14;
ax2.XLabel.String = 'Probe wavelength / nm';
ax2.YLabel.String = 'Absorbance';
ax2.YLabel.VerticalAlignment = 'bottom';
ax2.YLabel.Rotation = -90;
ax2.XAxisLocation = 'top';
ax2.XLim = ax1.XLim;
ax2.YLim = [0, 1];
ax2.XTickLabel = round(h * c ./ (ax2.XTick * 1.6e-19) * 1e9);
ax2.YAxisLocation = 'right';
ax2.Color = 'none';
ax1.Box = 'off';
ax2.Box = 'off';
legend([L1, L2, L3, L4], 'TA @ T = 1 ps', 'TA @ T = 10 ps', 'TA @ T = 100 ps', 'CdSe', 'fontsize', 12, 'location', 'northeast')
