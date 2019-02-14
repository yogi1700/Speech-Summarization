
[x, Fs, nbits]  = wavread('/home/iplab/Desktop/output_to_csv_result/StewartBrand_2006_1.wav'); 
[g, dg, a, ag]  = iaif(x,Fs)
g(g < 0) = 0;
g=smooth(g,10);
Frame_size = 20;
Frame_shift = 10;
window_type = 'hamming';
max_value = max(abs(g));
g = g / max_value;
energy = short_term_energy(g, Fs, Frame_size, Frame_shift, window_type);
tt = 1 / Fs:(Frame_shift / 1000):(length(energy)* (Frame_shift / 1000));
subplot(2,1,2);
plot(tt, energy);

y = Speech_signal;
Frame_size = Frame_size / 1000;
Frame_shift = Frame_shift / 1000;
t = 1 / Fs:1 / Fs: (length(y)/ Fs);
figure()
subplot(2,1,1);
plot(t,y);
%xtitle('Speech Waveform', 'time in seconds');
window_length = Frame_size * Fs;
sample_shift = Frame_shift * Fs;
sum1 = 0;
energy = 0 ;
w = window(window_type,window_length);
jj = 1;

for i = 1: (floor((length(y)) / sample_shift) - ceil(window_length / sample_shift))
 for j = ((( i - 1) * sample_shift) + 1) : ((( i - 1) * sample_shift) + window_length)
      y(j) = y(j) * w(jj);
      jj = jj + 1;
      yy = y(j) * y(j);
      sum1 = sum1 + yy;
 end

energy(i) = sum1;
sum1 = 0;
jj = 1;
end

w = 0;
c = energy;
return;
    
