
feature = readtable('/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/features.csv');
file_path = '/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/MFCC_Input/'
for i = 1:height(feature)
       name = string(char(table2cell(feature(i,1))))
       disp(name)
       file = strcat(file_path,name,'.mfc');
       disp(file)
       d = table2array(feature(i,2:5));
       writehtk(file,d,10,9);
end