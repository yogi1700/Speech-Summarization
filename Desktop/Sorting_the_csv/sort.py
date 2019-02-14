
import pandas as pd

import statistics

import csv

import numpy as np

df = pd.read_csv("/home/iplab/Desktop/Sorting_the_csv/b.csv")

# Updating the pitch value 

pitch = df.pitch  #you can also use df['column_name']

#print(Pitch)

pitch_sum = df.pitch.sum();

pitch_sd  = statistics.stdev(pitch)

le = len(pitch)

pitch_sum = pitch_sum / le

for i in range(le):
  df.set_value(i, "pitch", (pitch[i] - pitch_sum )/ pitch_sd)
  df.to_csv("b.csv", index=False)

print(pitch_sum)

print(pitch_sd)


# updating the intensity

intensity = df.intensity  #you can also use df['column_name']

#print(intensity)

int_sum = df.intensity.sum();

int_sd  = statistics.stdev(intensity)

le = len(intensity)

int_sum = int_sum / le

for i in range(le):
  df.set_value(i, "intensity", (intensity[i] - int_sum )/ int_sd)
  df.to_csv("b.csv", index=False)

print(int_sum)

print(int_sd)

# updating the slope

slope = df.slope  #you can also use df['column_name']

#print(slope)

slp_sum = df.slope.sum();

slp_sd  = statistics.stdev(slope)

le = len(slope)

slp_sum = slp_sum / le

for i in range(le):
  df.set_value(i, "slope", (slope[i] - slp_sum )/ slp_sd)
  df.to_csv("b.csv", index=False)

print(slp_sum)

print(slp_sd)

#updating the duration

duration = df.duration  #you can also use df['column_name']

#print(duration)

dr_sum = df.duration.sum();

dr_sd  = statistics.stdev(duration)

le = len(duration)

dr_sum = dr_sum / le

for i in range(le):
  df.set_value(i, "duration", (duration[i] - dr_sum )/ dr_sd)
  df.to_csv("b.csv", index=False)

print(dr_sum)

print(dr_sd)

