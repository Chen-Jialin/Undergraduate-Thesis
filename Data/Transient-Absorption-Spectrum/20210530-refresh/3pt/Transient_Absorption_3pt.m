clc; clear; close all;
file_path = [pwd, '\'];% 文件路径
files = dir([file_path, '*.raw']);% 文件列表
power = [];% 射频功率(rf power, %)
Delta_I_over_I = [];% Probe 光透射强度相对变化
for i = 1:length(files)
    file_name = files(i).name;% 文件名
    fid = fopen([file_path, file_name]);% 打开文件
    data = fread(fid,[10, 2049],'*double');% 读取数据
    fclose(fid);% 关闭文件
    [head, tail] = regexp(file_name, 'Prf\d+_');% 正则表达式识别 rf power，文件名中应包含类似“Prf20_”字样
    power = [power, str2double(file_name(head + 3:tail - 1))];
    disp(power(i))
    Delta_I_over_I = [Delta_I_over_I, sum(data(10:10,801:825))/25 - sum(data(9:9,801:825))/25];
    disp(['Delta I / I = ', num2str(Delta_I_over_I(i))])
    disp(' ')
end
plot(power, Delta_I_over_I, '.', 'markersize', 16)
hold on
% 过原点线性拟合 rf power 低于 10% 的数据点
power_low = power(power <= 10);
Delta_I_over_I_low = Delta_I_over_I(power <= 10);
x = [0, 40];
y = power_low' \ Delta_I_over_I_low' * x;
plot(x, y, '--','linewidth', 2)
ax = gca;
ax.FontSize = 14;
ax.XLabel.String = 'AOM Radio Frequency Power';
ax.YLabel.String = '\Delta{}I / I';
for i = 1:length(ax.XTick)
    ax.XTickLabel(i) = {[num2str(ax.XTick(i)), '%']};
end
for i = 1:length(ax.YTick)
    ax.YTickLabel(i) = {[num2str(ax.YTick(i) * 1e4), '‱']};
end