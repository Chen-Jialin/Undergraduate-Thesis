clc; clear; close all;
h = 6.63e-34;
c = 3e8;
file_path = [pwd, '\'];
files = dir([file_path, '*.raw']);
for i = 1:1%length(files)
    file_name = files(i).name;
    fid = fopen([file_path, file_name]);
    data = fread(fid, [2048,601], '*double');
    fclose(fid);
    disp(file_name)
    imshow(data(:,2:end)', [-0.01,0.01], 'colormap', jet(255))
    colorbar
    xlabel('Probe frequency', 'fontsize', 14)
    ylabel('Pump frequency', 'fontsize', 14)
end
