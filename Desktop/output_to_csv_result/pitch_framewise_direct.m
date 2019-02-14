

function [pi] = framewise_energy(file)

[y, fs, nb] = wavread(file);                          %# Load the signal into variable y

frameWidth = 500;                                      %# 10 msec
numSamples = length(y);                               %# Number of samples in y
numFrames = floor(numSamples/frameWidth);             %# Number of full frames in y
%pi = zeros(numFrames,1);                             %# Initialize energy
pi = 0;
sum1 = 0;
for frame = 1:numFrames                               %# Loop over frames
  startSample = (frame-1)*frameWidth+1;               %# Starting index of frame
  endSample  = startSample+frameWidth-1;              %# Ending index of frame
  spectrum =  pwelch(y(startSample:endSample));
  pi(frame,1) = mean(abs(10*log10(spectrum)));
end
