#!/bin/bash

array=( immh103MV2 immh149MV5 immh159MU5 naih111 preh118 preh119 preh138MV4 preh146 preh149MU5 preh149MU7 )
array2=( preh149MU5 preh149MU7 )
for i in "${array2[@]}"
do
	echo $i
	egrep -v '[0-9]{1,3}...0$' ${i}/${i}**.csv > ${i}.csv
done
