clc; clear; close all;
c = 3e8;% 光速

% 读取波长
data = load('WL_Spectrum-20210530.txt');
wavelength = data(3:end - 3,1);
% 像素点与波长对应关系（已去除两侧 alignment aid pixels）
figure(1)
plot(wavelength)
ylabel('Wavelength / nm')

file_path = [pwd, '\'];
file_name = 'TA-Long_start247.52_incre_-0.0150_step_61_ave20_probe_800_adj_25_Prf10__ 184_2049_2021-05-30-15-46-45.raw';
fid = fopen([file_path, file_name]);
data = fread(fid, [184, 2049], '*double');
fclose(fid);
delay_location_zero = 247.37;% 零时延位置（mm）
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
% 完整 TA 谱
figure(2)
imagesc(wavelength, delay_time, data(end - delay_location_step_num + 1:end, 4:end - 2), [-0.001, 0.001])
colorbar
xlabel('Wavelength / nm')
ylabel('Delay / ps')
% 横坐标为像素序号的完整 TA 谱
figure(3)
imagesc(3:2046, delay_time, data(end - delay_location_step_num + 1:end, 4:end - 3), [-0.1, 0.1])
colorbar
xlabel('Pixel num')
ylabel('Delay / ps')

% 区间积分 TA 谱
figure(4)
plot(delay_time', sum(data(end - delay_location_step_num + 1:end, 800:825) / 25, 2))
xlabel('Delay time / ps')
ylabel('\Delta{}I / I')

% surf(data(end - delay_location_step_num + 1:end, 800:end - 200),'edgecolor', 'none')