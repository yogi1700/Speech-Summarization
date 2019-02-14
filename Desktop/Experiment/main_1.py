

#
#segments5
#silence_ranges = detect_silence(sound, min_silence_len = 300, silence_thresh = -40, seek_step = 5)

#segments folder
#silence_ranges = detect_silence(sound, min_silence_len = 200, silence_thresh = -40, seek_step = 5)


#segments5
#silence_ranges = detect_silence(sound, min_silence_len = 100, silence_thresh = -40, seek_step = 5)


#mlskrishna.edu@gmail.com

from pydub import AudioSegment
from pydub.silence import split_on_silence
from pydub.silence import detect_silence
from pydub.silence import detect_nonsilent
from pydub.effects import strip_silence

sound = AudioSegment.from_wav("/home/yogi/Desktop/Experiment/AlGore_2009_edited.wav")


#use of detect_silence

"""keep_silence = 100
not_silence_ranges = split_on_silence(sound, min_silence_len = 1000, silence_thresh = -26)

chunks = []
for start_i, end_i in not_silence_ranges:
     start_i = max(0, start_i - keep_silence)
     end_i += keep_silence
     chunks.append(sound[start_i:end_i])

for i, chunk in enumerate(chunks):
   chunk.export("/home/student/Desktop/pp/chunk{0}.wav".format(i), format="wav")"""


#use of detect_silence

silence_ranges = detect_silence(sound, min_silence_len = 100, silence_thresh = -40, seek_step = 5)
chunks = []
temp3 = 0
for start_i, end_i in silence_ranges:
  print(start_i / 1000 * 60)
  print("\t")
  print(end_i / 1000 * 60)
  print("\n")
  
for start_i, end_i in silence_ranges:
     temp1 = start_i;
     temp2 = end_i;
     start_i = min(temp3, start_i)
     end_i = temp1;
     chunks.append(sound[start_i:end_i])
     temp3 = temp2; 

for i, chunk in enumerate(chunks):
    chunk.export("/home/yogi/Desktop/Experiment/Segments2/chunk{0}.wav".format(i), format="wav")


#use of detect_nonsilent

"""not_silence_ranges = detect_nonsilent(sound, min_silence_len =20000, silence_thresh=-26)
chunks = []
for start_i, end_i in not_silence_ranges:
     chunks.append(sound[start_i:end_i])

for i, chunk in enumerate(chunks):
    chunk.export("/home/student/Desktop/pp/chunk{0}.wav".format(i), format="wav")"""


#use of strip_silence

"""kk = strip_silence(sound, silence_len=1000, silence_thresh=-16, padding=100)
chunks = []
for start_i, end_i in kk:
     chunks.append(sound[start_i:end_i])

for i, chunk in enumerate(chunks):
    chunk.export("/home/student/Desktop/pp3/chunk{0}.wav".format(i), format="wav")"""

print("yes")
