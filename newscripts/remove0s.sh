#!/bin/bash

Harray=( immh103MV2 immh149MV5 immh159MU5 naih111 preh118 preh119 preh138MV4 preh146 preh149MU5 preh149MU7 )
Harray2=( preh149MU5 )
Larray=( IMML103 NAIL107 )
seqid="([a-z]{4}[0-9]{3}(([MUV]{2}[0-9])?))"
workdir=~/36Abs/results/$curdir
curdir=N120-NAIL107

loopedit () {
	local input=${array}
	for i in ${input[@]}; do 
		DIR=($workdir/${i}_$curdir.csv )
		echo $i $curdir 
		#sed 's/"//g' ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
		#sed "s/^,/${i}_$1,/" ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
		#sed "s/${i}_$1/${i}/" ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
		#sed -E "s/[a-z0-9]{6,9}_dif/$1/" ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
		#egrep -v '[0-9]{1,3}...0$' ${DIR} > ${DIR}a
	done
}

if [[ -n $1 ]] && [[ $1 =~ $seqid ]]; then
	echo input given
	input=$@
	loopedit $input	
elif [[ -z $1 ]]; then
	echo no input given
	input=${Harray}
	loopedit $input 
else
	echo input wrong
	break 
fi
