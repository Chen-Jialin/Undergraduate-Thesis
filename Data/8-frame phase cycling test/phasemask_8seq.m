function phasemask_8seq
clc;clear;close all;
file_path = [pwd, '\'];%'E:\LabVIEW_Projects\Teledyne_e2v_octoplus\ExperimentData\___2021-05-27\Raw_Data\';
files = dir([file_path, '*.RAW']);
raw_data = double(zeros(2048,9600));
for i=1:size(files)
    file_name = files(i).name;
    fid = fopen([file_path, file_name]);
    raw_data = raw_data + double(fread(fid,[2048, 9600],'*uint16'));
    fclose(fid);
end

data_OddEven = sum(reshape(raw_data,4096,1200,4),3);

data_add = (reshape(data_OddEven(1:2048,1:1200)+data_OddEven(2049:4096,1:1200),8192,300))./(8*400);%12800;

data_sub_2 = data_add(1+0*2048:1*2048,1:300)-data_add(1+1*2048:2*2048,1:300);

FT_add_2 = fft(data_sub_2,300,2);
FT_real_2 = real(FT_add_2);

data_sub_4 =( data_add(1+0*2048:1*2048,1:300)-data_add(1+1*2048:2*2048,1:300)+data_add(1+2*2048:3*2048,1:300)-data_add(1+3*2048:4*2048,1:300))/2;
FT_add_4 = fft(data_sub_4,300,2);
FT_real_4 = real(FT_add_4);

data_sub_4_P = data_add(1+0*2048:1*2048,1:300)-data_add(1+1*2048:2*2048,1:300)+data_add(1+2*2048:3*2048,1:300)-data_add(1+3*2048:4*2048,1:300);
FT_add_4_P = fft(data_sub_4_P,300,2);
FT_real_4_P = real(FT_add_4_P);

data_sub_Pi = -data_add(1+2*2048:3*2048,1:300)+data_add(1+3*2048:4*2048,1:300);
FT_add_Pi = fft(data_sub_Pi,300,2);
FT_real_Pi = imag(FT_add_Pi);

max_color = 8;
subplot(4,1,1),imshow(FT_real_2',[-max_color,max_color],'Colormap',jet(255));%[-max(max(abs(FT_real))),max(max(abs(FT_real)))];
subplot(4,1,2),imshow(FT_real_4',[-max_color,max_color],'Colormap',jet(255));%[-max(max(abs(FT_real))),max(max(abs(FT_real)))];
subplot(4,1,3),imshow(FT_real_4_P',[-max_color,max_color],'Colormap',jet(255));%[-max(max(abs(FT_real))),max(max(abs(FT_real)))];
subplot(4,1,4),imshow(FT_real_Pi',[-max_color,max_color],'Colormap',jet(255));%[-max(max(abs(FT_real))),max(max(abs(FT_real)))];
