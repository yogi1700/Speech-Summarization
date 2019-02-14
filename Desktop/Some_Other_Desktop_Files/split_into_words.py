
#import re

a=[]
with open('/home/iplab/Desktop/Result/output.txt','r') as f:
    for line in f:
        a.append([])
        i = 0;
        for word in line.split():
           a[line].append(word)
print("done") 
