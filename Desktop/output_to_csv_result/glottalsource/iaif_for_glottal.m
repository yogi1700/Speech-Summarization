 
% MyFolderInfo = dir('/home/iplab/Desktop/Segments/')

avg = zeros(length(MyFolderInfo), 1);


Files=dir('/home/iplab/Desktop/Segments/');
for k=1:length(Files)
   FileNames=Files(k).name
  
[x, Fs, nbits]  = wavread('/home/iplab/Desktop/Segments/'+FileNames); 
[g, dg, a, ag]  = iaif(x,Fs)
g(g < 0) = 0;


% code for assigning one variable to another variable

% % startIdx = 1;
% finalIdx = startIdx + size(g,1) - 1;
% b(startIdx:finalIdx) = g; 

% figure()
% subplot(2,1,1)
% plot(g);

g=smooth(g,10);

[peakValues, indexes] = findpeaks(g);
% subplot(2,1,2);
% plot(g'); hold on; 
% plot(indexes, peakValues, '*'); hold off;

% code for finding the intercepting point with curve 
% [xi] = interp1(peakValues,indexes,0.12180210743764);

% code for finding opening phase , closing phase and return phase
k = size(peakValues,1);
l = size(g, 1);
answer = zeros(k,4);
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
%     
%     if a == l
%         g(a) = 0;
%     end
%     
%     if b == 1
%         g(b) = 0;
%     end
    answer(i ,1) = indexes(i);
    answer(i, 2) = peakValues(i);
    answer(i, 3) = a;
    answer(i, 4) = b;   
    
end
k = size(answer, 1);
slope = zeros(k, 1);

sum = 0;

for i = 1 : k
     x = answer(i, 1);
     y = answer(i, 2);
     z = answer(i, 3);
     p = answer(i, 4);
     op =  y / (x - p);
     cl =  y / (x - z);
     slope(i, 1) = cl / op;
     sum = (cl / op) + sum;
end
avg(p) = sum / k;
end
    
%subplot(4,1,2);
%plot(dg);
%subplot(4,1,3)
%plot(a);
%subplot(4,1,4)
%plot(ag);
