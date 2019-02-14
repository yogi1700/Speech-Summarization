
from numpy import array

import statistics

import csv

import numpy as np

import pandas as pd

df = pd.read_csv("/home/iplab/Desktop/Sorting_the_csv/b.csv")

pitch = df.pitch 

le = len(pitch)

k = x = np.zeros(le)

print(k)

for i in range(le) :
	print(df.pitch[i])
	k[i] = df.pitch[i] + df.intensity[i] + df.slope[i] + df.duration[i] 

print(k)

df['sum'] = k;

df.to_csv("/home/iplab/Desktop/Sorting_the_csv/b.csv")

