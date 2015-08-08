#!/bin/bash
#Edit R script's sequence ids to produce graphs for all H-L chain pairings, including var domain key
#julielaffy 26/7/15
#date=date +%F

Harray=( immh103MV2 immh149MV5 immh159MU5 naih111 preh118 preh119 preh138MV4 preh146 preh149MU5 preh149MU7 )
Harray2=( preh138MV4 )
Larray=( NAIL120 IMML103 NAIL107 )
Larray2=( NAIL107 )

Hseqid="([a-z]{4}[0-9]{3}(([MUV]{2}[0-9])?))"
Lseqid="([A-Z]{4}[0-9]{3}/)"

#for i in "${Larray[@]}"
#do 
#	sed -E "s/$Lseqid/"${i}/"/g" backupcontdiffs.R > backupcontdiffs.R.tmp && mv backupcontdiffs.R.tmp backupcontdiffs.R
#	echo replaced with ${i}
for j in "${Harray[@]}"
do 
	sed -E "s/$Hseqid/${j}/g" backupcontdiffs.R > backupcontdiffs.R.tmp && mv backupcontdiffs.R.tmp backupcontdiffs.R
	Rscript backupcontdiffs.R
	echo replaced with ${j}
	echo ran ${i} ${j}
done
#done	




#if [ -n $1 ] && [[ $1 =~ $seqid ]]
#then 
#fi



