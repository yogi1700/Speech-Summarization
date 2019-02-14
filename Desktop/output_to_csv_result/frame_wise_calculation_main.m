
% call above function
[y, Fs, bits] = wavread('/home/iplab/Desktop/HMM_Dataset/Sentence_Segmentation/AriannaHuffington_2010W/L1/AriannaHuffington_2010W_1_1.wav');
Frame_size = 1000000;
Frame_shift = 500000;
window_type = 'rectwin';
max_value = max(abs(y));
y = y / max_value;
energy = framewise_pitch(y, Fs, Frame_size, Frame_shift, window_type);
tt = 1 / Fs:(Frame_shift / 1000):(length(energy)* (Frame_shift / 1000));
subplot(2,1,2);
plot(tt, energy);
%xtitle('Short term energy', 'time in seconds');

