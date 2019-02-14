
from pydub import AudioSegment
from pydub.silence import split_on_silence
from pydub.silence import detect_silence
from pydub.silence import detect_nonsilent
from pydub.effects import strip_silence

sound = AudioSegment.from_wav("/home/student/Desktop/Lal_edited.wav")


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

silence_ranges = detect_silence(sound, min_silence_len = 3000, silence_thresh = -30)
chunks = []
temp3 = 0
for start_i, end_i in silence_ranges:
     temp1 = start_i;
     temp2 = end_i;
     start_i = min(temp3, start_i)
     end_i = temp1;
     chunks.append(sound[start_i:end_i])
     temp3 = temp2; 

for i, chunk in enumerate(chunks):
    chunk.export("/home/student/Desktop/f/chunk{0}.wav".format(i), format="wav")


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

print "yes"
