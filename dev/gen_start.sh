#! /bin/bash
# Usage: sh gen_start.sh path task_name

echo 'Generating start file for task on cluster'

# File managment
filename=start.sh
l_path=$1
appname=$2

# Time managment
HH=00
MM=05
SS=00

# Cores and nodes
C=2
N=2

rm -f $filename
touch $filename

echo '#!/bin/bash' >> $filename
echo '#PBS -S /bin/bash' >> $filename
echo '#PBS -N ' $appname >> $filename
echo '#PBS -l ' walltime=$HH:$MM:$SS,nodes=$N:ppn=$C >> $filename
echo '#PBS -o out.txt' >> $filename
echo '#PBS -e err.txt' >> $filename

echo 'cd ' $l_path >> $filename
echo '/opt/ompi/1.3.3/gcc/4.1/bin/mpiexec ' $appname >> $filename


