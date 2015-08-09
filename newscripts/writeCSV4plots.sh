#!/bin/bash
#Edit R script's sequence ids to produce graphs for all H-L chain pairings, including var domain key
#julielaffy 26/7/15; date=date +%F

Harray=( immh103MV2 immh149MV5 immh159MU5 naih111 preh118 preh119 preh138MV4 preh146 preh149MU5 preh149MU7 )
Larray=( NAIL120 IMML103 NAIL107 )
Hseqid="([a-z]{4}[0-9]{3}(([MUV]{2}[0-9])?))"
Lseqid="([A-Z]{4}[0-9]{3}/)"

loopedit () {
	local array=${input}
	for j in ${array[@]}; do
		sed -E "s/$Hseqid/${j}/g" writeCSV4plots.R > writeCSV4plots.R.tmp && mv writeCSV4plots.R.tmp writeCSV4plots.R
		Rscript writeCSV4plots.R
		echo ran with ${j}
	done
}	

if [[ -n $1 ]] && [[ $@ =~ $Hseqid ]]; then
        input=$@
        echo $input given
        loopedit $input
elif [[ -z $1 ]]; then
        echo no input given
        input=${Harray[@]}
        loopedit $input
else
        echo input wrong
fi


