from HTK import HTKFile
import numpy as np
htk_reader = HTKFile()
htk_reader.load("/home/iplab/Desktop/HMM_Implementation_Input_Increase_2_writehtk/HMM_Implementation/MFCC_Input_Original/AriannaHuffington_2010W_1_1.mfc")
result = np.array(htk_reader.data)
print(result)
