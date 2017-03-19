#! /bin/bash

array=( 2 3 4 5 10 15 20 25 30 40 50 60 70 80 90 100 )
for i in "${array[@]}"
do
	echo Process with $i nodes
	mpiexec -np $i ./mm
done


