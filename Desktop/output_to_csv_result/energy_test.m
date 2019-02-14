% function to plot speech wavform and compute short term energy

[y, Fs, bits] = wavread('/home/iplab/Desktop/HMM_Dataset/Sentence_Segmentation/AriannaHuffington_2010W/L1/AriannaHuffington_2010W_1_1.wav');
Frame_size = 100;
Frame_shift = 50;
window_type = 'rectwin';
t = 1 / Fs:1 / Fs: (length(y)/ Fs);
figure()
subplot(2,1,1);
plot(t,y);
window_length = Frame_size * Fs;
sample_shift = Frame_shift * Fs;
sum1 = 0;
pi = 0 ;
w = window(window_type,window_length);
jj = 1;
sum2 = 0;
yy = 0;
for i = 1: (floor((length(y)) / sample_shift) - ceil(window_length / sample_shift))
 for j = ((( i - 1) * sample_shift) + 1) : ((( i - 1) * sample_shift) + window_length)
      temp = y(j) * w(jj);
      jj = jj + 1;
      % yy = pitch(y(j),Fs);
      % spectrum = pwelch(temp);
      % yy = 10*log10(spectrum);
      % yy = mean(temp);
      yy = std(temp);
      disp(yy);
      sum1 = sum1 + yy;
 end
sum2  = sum2 + sum1;
pi(i) = sum1;
sum1 = 0;
jj = 1;
end

w = 0;
c = pi;
disp(sum2);
return;