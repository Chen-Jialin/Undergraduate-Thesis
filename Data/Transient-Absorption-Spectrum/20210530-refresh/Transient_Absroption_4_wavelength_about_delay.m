clc; clear; close all;
h = 6.63e-34;% 普朗克常数
c = 3e8;% 光速
% 读取波长
data = load('WL_Spectrum-20210530.txt');
wavelength = data(3:end - 2,1);
energy = h * c ./ (wavelength * 1e-9) / 1.6e-19;
probe_spectrum = data(3:end - 2, 2);
delay_location_zero = 247.37;% 零时延位置（mm）
file_path = [pwd, '\'];
file_name_list = {'TA-Long_start247.52_incre_-0.0150_step_61_ave20_probe_800_adj_25_Prf10__ 184_2049_2021-05-30-15-46-45.raw',...
                  'TA-Long_start248.87_incre_-0.150_step_111_ave20_probe_800_adj_25_Prf10__ 334_2049_2021-05-30-15-53-02.raw',...
                  'TA-Long_start262.37_incre_-1.500_step_61_ave20_probe_800_adj_25_Prf10__ 184_2049_2021-05-30-15-57-25.raw'};
delay_data = [];
delay_data_chop_off = [];
for i = 1:length(file_name_list)
    file_name = file_name_list{i};
    fid = fopen([file_path, file_name]);
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
    
%     I_chop_off = data(2:2:end - delay_location_step_num - 1, 4:end - 2);% chop off
%     I_chop_on = data(3:2:end - delay_location_step_num, 4:end - 2);% chop on
%     Delta_I = I_chop_on - I_chop_off;
%     Delta_I = Delta_I - mean(Delta_I(1:8, :));
%     % 局部平均以平滑含噪数据
%     % 关于 probe 能量
%     window = 0.01;% 平均窗口（eV）
%     window_half = window / 2;
%     Delta_I_ave = zeros(size(Delta_I));
%     for j = 1:length(energy)
%         energy_j = energy(j);
%         Delta_I_local_sum = Delta_I(:, j);
%         Delta_I_col_num = 1;
%         for k = (j - 1):-1:1
%             if energy(k) < (energy_j + window_half)
%                 Delta_I_local_sum = Delta_I_local_sum + Delta_I(:, k);
%                 Delta_I_col_num = Delta_I_col_num + 1;
%             else
%                 break
%             end
%         end
%         for k = (j + 1):length(energy)
%             if energy(k) > (energy_j - window_half)
%                 Delta_I_local_sum = Delta_I_local_sum + Delta_I(:, k);
%                 Delta_I_col_num = Delta_I_col_num + 1;
%             else
%                 break
%             end
%         end
%         Delta_I_ave(:, j) = Delta_I_local_sum / Delta_I_col_num;
%     end
%     Delta_I_over_I = Delta_I_ave ./ probe_spectrum';
%     delay_data = [delay_data; delay_time', Delta_I_over_I];
%     delay_data_chop_off = [delay_data_chop_off; delay_time', I_chop_on];
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
    delay_data = [delay_data; delay_time', data_ave];
end

figure(1)
t = tiledlayout(1,1);
ax1 = axes(t);
delay_data = sortrows(delay_data);
delay_time = delay_data(:, 1);
data = delay_data(:, 2:end);
plot(delay_time, data(:, 1015), 'linewidth', 2)% 1.92 eV, 647.4609 nm
hold on
plot(delay_time, data(:, 861), 'linewidth', 2)% 2.0 eV, 621.5625 nm
plot(delay_time, data(:, 669), 'linewidth', 2)% 2.1 eV, 591.9643 nm
plot(delay_time, data(:, 338), 'linewidth', 2)% 2.3 eV, 540.4891 nm
legend('1.92 eV (646 nm)' ,'2.0 eV (622 nm)', '2.1 eV (592 nm)', '2.3 eV (540 nm)', 'fontsize', 10, 'location', 'northwest')
ax1.FontSize = 14;
ax1.XLabel.String = 'Pump-probe delay / ps';
ax1.YLabel.String = '\Delta{}I / I';
ax1.XLim = [min(delay_time), max(delay_time)];
ax1.YLim = [-0.0005, 0.002];
for i = 1:length(ax1.YTick)
    ax1.YTickLabel(i) = {[num2str(ax1.YTick(i) * 1000), '‰']};
end
% ax1.YLim = [-500, 2000];

% figure(2)
% delay_data_chop_off = sortrows(delay_data_chop_off);
% delay_time = delay_data_chop_off(:, 1);
% data = delay_data_chop_off(:, 2:end);
% plot(delay_time, sum(data(:, 1001:1025), 2), 'linewidth', 2)% 1.92 eV, 647.4609 nm
% hold on
% plot(delay_time, sum(data(:, 834:858), 2), 'linewidth', 2)% 2.0 eV, 621.5625 nm
% plot(delay_time, sum(data(:, 644:669), 2), 'linewidth', 2)% 2.1 eV, 591.9643 nm
% plot(delay_time, sum(data(:, 317:341), 2), 'linewidth', 2)% 2.3 eV, 540.4891 nm
% legend('1.92 eV (646 nm)' ,'2.0 eV (622 nm)', '2.1 eV (592 nm)', '2.3 eV (540 nm)', 'fontsize', 12)
% xlabel('Pump-probe delay / ps', 'fontsize', 16)
% ylabel('I / a.u.', 'fontsize', 16)