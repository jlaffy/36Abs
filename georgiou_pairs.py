# from Bio import SeqIO
import pandas as pd
import os

path = os.getcwd()

path2 = 'Users/julielaffy/Desktop'
data = 'georgiou_data1'

wb = pd.read_csv(path + '/' + data + '.csv')
h3 = wb['H3 Junction']
l3 = wb['L3 Junction']

textfile = open(path + '/' + data + '.txt', 'w')
for i, seq in enumerate(h3):
    fasta = '>Name' + str(i) + '\n%s\n' % seq
    textfile.write(fasta)
textfile.close()
