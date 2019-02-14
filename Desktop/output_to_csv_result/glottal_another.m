

function [glottal1, glottal2] = framewise_energy(file)

[y, fs, nb] = wavread(file);
%# Load the signal into variable y

frameWidth = 500;                                    %# 10 msec
numSamples = length(y);                              %# Number of samples in y
numFrames = floor(numSamples/frameWidth);            %# Number of full frames in y
energy = zeros(numFrames,1);                         %# Initialize energy
glottal1 = 0;
glottal2 = 0;
avg1 = 0;
avg2 = 0;
for frame = 1:numFrames                              %# Loop over frames
  startSample = (frame-1)*frameWidth+1;              %# Starting index of frame
  endSample = startSample+frameWidth-1;              %# Ending index of frame
  [avg1,avg2] = glottal_parameter(y(startSample:endSample),fs);   %# Calculate frame energy
  glottal1(frame,1) = avg1;
  glottal2(frame,1) = avg2;
  
end
return;
end
