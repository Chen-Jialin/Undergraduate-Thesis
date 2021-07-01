clc; clear; close all;
file_path = [pwd, '\'];
files = dir([file_path, '*.raw']);
power = [];
Delta_I_over_I = [];
for i = 1:length(files)
    file_name = files(i).name;
    fid = fopen([file_path, file_name]);
    data = fread(fid,[2048,9],'*double');
    fclose(fid);
    [head, tail] = regexp(file_name, 'Prf\d+_');
    power = [power, str2double(file_name(head + 3:tail - 1))];
    disp(power)
    Delta_I_over_I = [Delta_I_over_I, sum(data(801:825,9:9))/25 - sum(data(801:825,8:8))/25];
    disp(['Delta I / I = ', num2str(Delta_I_over_I(i))])
    disp(' ')
end
plot(power, Delta_I_over_I, '.')
