#!/bin/bash

Harray=( immh103MV2 immh149MV5 immh159MU5 naih111 preh118 preh119 preh138MV4 preh146 preh149MU5 preh149MU7 )
Harray2=( preh149MU5 )
Larray=( IMML103 NAIL107 )

for i in "${Harray[@]}"
do
	DIR=( ~/36Abs/results/$1/${i}_$1.csv )
	echo $i $1 
	#sed 's/"//g' ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
	#sed "s/^,/${i}_$1,/" ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
	sed "s/${i}_$1/${i}/" ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
	sed -E "s/[a-z0-9]{6,9}_dif/$1/" ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
	#egrep -v '[0-9]{1,3}...0$' ${DIR} > ${DIR}a
done
