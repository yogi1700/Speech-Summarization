
n = 2000
count = [n 10];
fid=fopen('/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/MFCC_Input_Original/AriannaHuffington_2010W_1_1.mfc','rb') % opens the file for reading
B = fread(fid, count, 'int16') % reads _count_elements and stores them in A.
% dlmwrite('data.csv',A,',');
