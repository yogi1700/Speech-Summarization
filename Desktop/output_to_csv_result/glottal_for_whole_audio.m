
% accessing files of the directory

Files = dir('/home/iplab/Desktop/Dataset_for_writehtk_feature_Extraction/all/');

avg = zeros(length(Files), 2);
% name = strings(length(Files), 1);
%C = cell(length(Files), 3);

for m=3:length(Files)
   
FileNames = Files(m).name;

myFile = sprintf('/home/iplab/Desktop/Dataset_for_writehtk_feature_Extraction/all/%s',FileNames);

[x, Fs, nbits]  = wavread(myFile); 

[g, dg, a, ag] = iaif(x,Fs);

g(g < 0) = 0;

g=smooth(g,10);

[peakValues, indexes] = findpeaks(g);

k = size(peakValues,1);

l = size(g, 1);

answer = zeros(k,6);

for i = 1 : k    
    for a = indexes(i) : l
        if g(a) == 0
            break
        end    
    end
    for b = indexes(i) : -1 : 1
        if g(b) == 0
            break
        end    
    end
    answer(i ,1) = indexes(i);
    answer(i, 2) = peakValues(i);
    answer(i, 3) = a;
    answer(i, 4) = b;   
    answer(i, 5) = (indexes(i) - b) / Fs;
    answer(i, 6) = (a - indexes(i)) / Fs;
    
end

k = size(answer, 1);
sum1 = 0;
sum2 = 0;
for i = 1 : k
     x = answer(i, 1);
     y = answer(i, 2);
     z = answer(i, 3);
     p = answer(i, 4);
     op =  y / (x - p);
     cl =  y / (x - z);
     sum1 = (cl / op) + sum1;
     sum2 = sum2 + (answer(i, 6) / answer(i, 5));
end
  %avg(m, 1) = sum1;
  avg(m, 1) = sum1 / k;
  avg(m, 2) = sum2 / k;
%  C(m, 1) = str2double(myFile);
%  C(m, 2) = sum1 / k;
%  C(m, 3) = sum2 / k;
  csvwrite('file.csv',avg);
 
end