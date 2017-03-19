#!/bin/bash
#PBS -S /bin/bash
#PBS -N  mm
#PBS -l  walltime=00:05:00,nodes=2:ppn=2
#PBS -o out.txt
#PBS -e err.txt
cd  /home/localusers/is32/is3205/files/lab_2
/opt/ompi/1.3.3/gcc/4.1/bin/mpiexec  mm
