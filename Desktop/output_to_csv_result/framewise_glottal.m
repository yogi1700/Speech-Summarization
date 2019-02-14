% function to plot speech wavform and compute framewise glottal parameter

function [c1,c2] = framewise_glottal(Speech_signal, Fs, Frame_size, Frame_shift, window_type)

y = Speech_signal;
Frame_size = Frame_size / 10000;
Frame_shift = Frame_shift / 10000;

window_length = Frame_size * Fs;
sample_shift = Frame_shift * Fs;

sum1 = 0;
sl = 0 ;
dr = 0 ;

w = window(window_type, window_length);

fprintf('y(i) = %d\t y = %d\t , sample_shift = %d\t, window_length = %d\t, w = %f\n',y(1), length(y),sample_shift, window_length);
jj = 1;
sum2 = 0;

for i = 1: (floor((length(y)) / sample_shift) - ceil(window_length / sample_shift))
 for j = ((( i - 1) * sample_shift) + 1) : ((( i - 1) * sample_shift) + window_length)
      temp = y(j) * w(jj);
      jj = jj + 1;
      fprintf('length of temp = %f\n',y(i));
      [yy1, yy2] = glottal_parameter(temp, Fs);
      sum1 = sum1 + yy1;      
      sum2 = sum2 + yy2;
 end
  sl(i) = sum1;
  dr(i) = sum2;
  sum1 = 0;
  jj = 1;
end
w = 0;
c1 = sl;
c2 = dr;
fprintf('m = %f\n', c1);
fprintf('m = %f\n',c2);
return;
end