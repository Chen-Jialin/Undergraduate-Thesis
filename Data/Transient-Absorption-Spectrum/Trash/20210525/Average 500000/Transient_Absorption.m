clc; clear; close all;
file_path = [pwd, '\'];
files = dir([file_path, '*.raw']);
power = [];
Delta_I_over_I = [];
for i = 1:length(files)
    file_name = files(i).name;
    fid = fopen([file_path, file_name]);
    data = fread(fid,[10, 2049],'*double');
    fclose(fid);
    [head, tail] = regexp(file_name, 'Prf\d+_');
    power = [power, str2double(file_name(head + 3:tail - 1))];
    disp(power(i))
    Delta_I_over_I = [Delta_I_over_I, sum(data(10:10,801:825))/25 - sum(data(9:9,801:825))/25];
    disp(['Delta I / I = ', num2str(Delta_I_over_I(i))])
    disp(' ')
end
plot(power, Delta_I_over_I, '.')
ax = gca;
ax.FontSize = 14;
ax.XLabel.String = 'AOM Radio Frequency Power';
ax.YLabel.String = '\Delta I / I';
for i = 1:length(ax.XTick)
    ax.XTickLabel(i) = {[num2str(ax.XTick(i)), '%']};
end
for i = 1:length(ax.YTick)
    ax.YTickLabel(i) = {[num2str(ax.YTick(i) * 1e4), '‱']};
end