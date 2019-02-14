
% call above function
[y, Fs, bits] = wavread('/home/iplab/Desktop/HMM_Dataset/Sentence_Segmentation/AriannaHuffington_2010W/L1/AriannaHuffington_2010W_1_1.wav');
Frame_size = 100;
Frame_shift = 50;
window_type = 'rectwin';
max_value = max(abs(y));
y = y / max_value;
%[c1,c2] = framewise_glottal(y, Fs, Frame_size, Frame_shift, window_type);
%fprintf('c1 = %f\t, c2 = %f\n', c1,c2);

% tt = 1 / Fs:(Frame_shift / 1000):(length(energy)* (Frame_shift / 1000));
% subplot(2,1,2);
% plot(tt, c1);
%xtitle('Short term energy', 'time in seconds');