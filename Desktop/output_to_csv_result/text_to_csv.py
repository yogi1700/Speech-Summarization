import csv

with open("/home/iplab/Desktop/Result/output.txt", 'r') as infile, open("b.csv", 'w') as outfile:
     stripped = (line.strip() for line in infile)
     lines = (line.split(",") for line in stripped if line)
     writer = csv.writer(outfile)
     writer.writerows(lines)
