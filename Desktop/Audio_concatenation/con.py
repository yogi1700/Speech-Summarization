


import wave

import os

import re

#infiles = ["sound_1.wav", "sound_2.wav"]
outfile = "sounds.wav"

path = "/home/iplab/Desktop/Audio_concatenation/Important_word/"

path_out = "/home/iplab/Desktop/Audio_concatenation/"

infiles = os.listdir(path)

print(infiles)


infiles.sort(key=lambda var:[int(x) if x.isdigit() else x for x in re.findall(r'[^0-9]|[0-9]+', var)])


print(infiles)

data= []

for infile in infiles:
    w = wave.open(path + infile, 'rb')
    data.append( [w.getparams(), w.readframes(w.getnframes())] )
    w.close()

output = wave.open(path_out + outfile, 'wb')

print(len(infiles))


output.setparams(data[0][0])

for i in range(len(infiles)) :
	output.writeframes(data[i][1])

output.close()

