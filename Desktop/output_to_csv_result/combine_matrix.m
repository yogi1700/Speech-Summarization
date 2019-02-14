
myDir = '/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/hmm_test_htk_format/BirkeBaehr_2010X/MFCC/'; %gets directory
store = '/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/hmm_test_htk_format/BirkeBaehr_2010X/MFCC2HTk/';
myFiles = dir(fullfile(myDir,'*.mfc')); % gets all mfc files in struct
for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  C = strsplit(baseFileName,'.');
  disp(C(1));
  
  str3 = C(1);
  file = strcat(myDir, str3,'.wav');
  disp(file);
 
  [energy] = framewise_energy(char(file));
  [pitch] = pitch_framewise_direct(char(file));
  [glottal1, glottal2] = glottal_another(char(file));
  d = size(energy);
  
  n = d(1);
  count = [n 10];
  str1 = char(strcat(myDir,baseFileName));
  disp(str1);
  fid = fopen(char(str1),'rb'); % opens the file for reading
  A = fread(fid, count, 'int16') ;% reads _count_elements and stores them in A.
  
  A = [A energy pitch glottal1 glottal2];
  str2 = strcat(store,str3);
  writehtk(char(str2), A, 0.094, 9);
  disp(k);
end

