
fs = 1e3;

t = 0:1/fs:1;

x = [1 2]*sin(2*pi*[50 250]'.*t) + randn(size(t))/10;

%Lowpass-filter the signal to remove the high-frequency tone. Specify a passband frequency of 150 Hz. Display the original and filtered signals, and also their spectra.

lowpass(x,150,fs)