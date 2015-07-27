#!/bin/bash
#Edit R script's sequence ids to produce graphs for all H-L chain pairings, including var domain key
#julielaffy 26/7/15

date= date +%F

#array= ( immh103MV2 immh149MV5 immh159MU5 naih111 preh118 preh119 preh138MV4 preh146 preh149MU5 preh149MU7 )

seqid= $1

#if [ $1 -eq 0]; then
#	for i in "${array[@]}"; do seqid= ${i}; done 
#	done		
#fi

sed -E 's/([a-z]{4}[0-9]{3}(([MUV]{2}[0-9])?))/$seqid/g' TEST_cont_diffs.R > TEST_cont_diffs.R.tmp && mv TEST_cont_diffs.R.tmp TEST_cont_diffs.R


