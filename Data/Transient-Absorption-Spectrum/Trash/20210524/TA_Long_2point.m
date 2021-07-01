function TA_Long_2point
fid = fopen ('E:\LabVIEW_Projects\Teledyne_e2v_octoplus\V_0.9.0.17-Beta\TA_Result\TA-Long-CdSe640-2pt-Prf35_   9_2048_2021-05-24-21-26-26.raw');
data = fread(fid,[2048,9],'*double');
fclose(fid);
imshow(data);
plot(data(:,9:9));
A = sum(data(801:825,9:9))/25
B = sum(data(801:825,9:9))/25 - sum(data(801:825,8:8))/25
