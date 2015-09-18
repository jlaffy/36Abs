import pandas as pd

#  should write a tsv2csv.sh, containing (below)
#  as this is what I did to get tsv in desired format for pandas manip:
#  sed 's/ /,/g' myfile.tsv > myfile.csv
#  echo 'this,is,header,row' > header.txt
#  cat header.txt myfile.csv > myfilewithheader.csv


df = pd.read_csv('cdr3_sabdab_all_organisms.csv')
seqcol = df['seq']

#  Replace cdr3 sequence with its length
for i in range(len(seqcol)):
    seqcol[i] = len(seqcol[i])

#  Count frequency of each length value and group by length ('seq')
counts = df.groupby('seq').count()

#  write df to csv
counts.to_csv('cdr3_counts_all_organisms.csv')

#  Then I opened csv in excel, changed first two header names and deleted last
#  two rows (as they were the same as the second)
