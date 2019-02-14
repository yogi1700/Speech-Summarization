
myDir = '/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/hmm_test_htk_format/BirkeBaehr_2010X/MFCC/'; %gets directory
myFiles = dir(fullfile(myDir,'*.mfc')); % gets all mfc files in struct
store = '/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/hmm_test_htk_format/BirkeBaehr_2010X/MFCC2HTk/';
for k = 1:length(myFiles)
      baseFileName = myFiles(k).name;
      C = strsplit(baseFileName,'.');
      disp(C(1));
      str3 = C(1);
      str1 = char(strcat(myDir,baseFileName));
      fid = fopen(char(str1),'rb');
      n = 2000;
      count = [n 14];
      A = fread(fid, count, 'int16'); % reads _count_elements and stores them in A.
      str2 = strcat(store,str3);
      writehtk(char(str2), A, 0.094, 9);
end;