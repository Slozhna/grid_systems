#! /bin/bash

filename=$1

echo ===========================================================
echo Post-deployment script. Compiling and adding to query.
echo ===========================================================

sh compile_all.sh $filename

qsub start.sh

qstat

echo ==================== ERROR ================================
cat err.txt
cat out.txt
echo ==================== INFO =================================
