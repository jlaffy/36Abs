#  from Bio import SeqIO
import pandas as pd
import os

os.getcwd()
path = '/Users/julielaffy/36Abs/georgiou_db'
os.chdir(path)

for sheet in range(1, 4):
    donor = 'd' + str(sheet)
    print donor
    data = 'georgiou_data' + str(sheet)
    print data
    filename = 'georgiou' + '_' + donor + '_'
    print filename
    wb = pd.read_csv(path + '/' + data + '.csv')
    h3 = wb['H3 Junction']
    l3 = wb['L3 Junction']
    textfile = open(path + '/' + filename + 'h3.txt', 'w')
    for i, seq in enumerate(h3):
        fasta = '>id' + str(i) + '\n%s\n' % seq
        textfile.write(fasta)
    textfile.close()
