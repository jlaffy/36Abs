import re
from collections import Counter

def get_codes(filename):
    with open(filename) as f:
        contents = f.read()
    return re.findall(r'(?<=\npdb\|).{4,}(?=\|[A-Z]{1})', contents)


files = ["4NKI!BLAST_pre119.txt", "BLAST_ immh103_M_V3_22024.txt", "BLAST_ immh159_M_UN_59280.txt", "BLAST_ preh138_M_V3_494120.txt", 
"BLAST_ preh149_M_UN_598450.txt", "BLAST_ preh149_M_UN_713160.txt", "BLAST_ preh159_M_V3_60711.txt", 
"BLAST_immh103_MUN298.txt", "BLAST_immh149_M_V3_59726.txt", "BLAST_naih111.txt", "BLAST_pre118.txt", "BLAST_preh146.txt"]

results = []

for file in files:
    results = results + get_codes(file)

print Counter(result for result in results)
