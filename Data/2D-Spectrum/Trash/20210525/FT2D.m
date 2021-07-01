clc; clear; close all;
h = 6.63e-34;
c = 3e8;
file_path = [pwd, '\'];
files = dir([file_path, '*.raw']);
for i = 1:1%length(files)
    file_name = files(i).name;
    fid = fopen([file_path, file_name]);
    data = fread(fid, [2048,601], '*double');
    probe_freq = c ./ (data(:, 1) * 1e-9);
    pump_freq = linspace(0, 1 / 3.5e-15 / 2, 150) + 1.5 / 3.5e-15;
    [probe_Freq, pump_Freq] = meshgrid(probe_freq, pump_freq);
    data = data(3:2046, 152:301)';
    fclose(fid);
    disp(file_name)
%     imshow(data, [-0.1,0.1], 'colormap', jet(255))
    imagesc(probe_freq, pump_freq, data, [-0.01, 0.01])
    colormap(jet(255))
    colorbar
    hold on
    ax = gca;
    ax.FontSize = 14;
    ax.XLabel.String = 'Probe frequency / Hz';
    ax.YLabel.String = 'Pump frequency / Hz';
    ax.YDir = 'normal';
%     ax.XLim(1) = 0;
%     ax.YLim(1) = 0;
end