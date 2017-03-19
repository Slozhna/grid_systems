#! /bin/bash

f_path=/home/localusers/is32/is3205/files
l_path=lab_2

filename=$1
start_file=start.sh
compiler_file=compile_all.sh
post_deploy_file=post_deploy.sh

echo ===========================================================
echo Pre-deployment script. Generating and uploading files only.
echo ===========================================================

sh gen_start.sh $f_path/$l_path $filename
echo ===========================================================

sh send_file.sh $f_path/$l_path *.c
sh send_file.sh $f_path/$l_path $start_file
sh send_file.sh $f_path/$l_path $compiler_file
sh send_file.sh $f_path/$l_path $post_deploy_file
echo ===========================================================

echo  !!! Run: 'sh post_deploy.sh ' $filename
sh connect.sh
echo ===========================================================
