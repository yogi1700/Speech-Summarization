


% function to plot speech wavform and compute short term energy

function c[] = short_term_energy(Speech_signal, Fs, Frame_Size, Frame_shift, window_type)
y = Speech_signal;
Frame_size = Frame_size / 1000;
Frame_shift = Frame_shift / 1000;
t = 1 / Fs:1 / Fs: (length(y)/ Fs);
subplot(2,1,1);
plot(t,y);
xtitle('Speech Waveform', 'time in seconds');
window_length = Frame_size * Fs;
sample_shift = Frame_shift * Fs;
sum1 = 0;
energy = 0;
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
return(c);
endfunction

[y, Fs, bits] = wavread('');
Frame_size = 20 ;
Frame_shift = 10;
window_type = 're';

max_value = max(abs(y));
y = y / max_value;
energy = short_term_energy(y, Fs, Frame_size, Frame_shift, window_type);
tt = 1 / Fs:(Frame_shift / 1000):(length(energy)* (Frame_shift / 1000));
subplot(2,1,2);
plot(tt.energy);
xtitle('Short term energy', 'time in seconds');


