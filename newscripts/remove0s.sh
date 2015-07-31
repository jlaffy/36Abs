#!/bin/bash

Harray=( immh103MV2 immh149MV5 immh159MU5 naih111 preh118 preh119 preh138MV4 preh146 preh149MU5 preh149MU7 )
Harray2=( preh149MU5 )
Larray=( IMML103 NAIL107 )
Larray2=(  )

#for j in "${Larray2[@]}"
#do
for i in "${Harray2[@]}"
do
	#DIR=( ~/36Abs/results/kappa_pairs/proABC/${j}/${i}/${i} )
	DIR=( ~/36Abs/results/nail120-nail107/${i}_120107.csv )
	echo $j $i
	sed 's/"//g' ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
	sed 's/^,/preh149MU5_120107,/' ${DIR} > ${DIR}a && mv ${DIR}a ${DIR}
	egrep -v '[0-9]{1,3}...0$' ${DIR} > ${DIR}b
done
#done
