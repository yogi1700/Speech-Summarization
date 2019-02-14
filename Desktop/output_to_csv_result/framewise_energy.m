
function [energy] = framewise_energy(file)

[y, fs, nb] = wavread(file);                  

%# Load the signal into variable y

frameWidth = 500;                                      %# 10 msec
numSamples = length(y);                                %# Number of samples in y
numFrames = floor(numSamples/frameWidth);              %# Number of full frames in y
%energy = zeros(numFrames,1);                          %# Initialize energy
disp(numSamples);
disp(frameWidth);
energy = 0;
disp(numFrames);
for frame = 1:numFrames                               %# Loop over frames
  disp(frame);  
  startSample = (frame-1)*frameWidth+1;               %# Starting index of frame
  endSample = startSample+frameWidth-1;               %# Ending index of frame
  frameIndex = startSample:endSample;
  energy(frame,1) = sum(y(frameIndex).^2);            %# Calculate frame energy
end
return;
end