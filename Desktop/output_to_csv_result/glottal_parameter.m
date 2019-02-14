
function [avg1, avg2] = glottal_parameter(x, Fs)

[g, dg, a, ag] = iaif(x,Fs);

g(g < 0) = 0;

fprintf('previous\n');

g=smooth(g,10); 

plot(g);

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
  avg1 = sum1 / k;
  avg2 = sum2 / k;
  
  %disp(avg(1, 1));
  fprintf('m = %f\n', sum1);  % Method 1
  disp(avg1);
  
return;

end