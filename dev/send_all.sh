#! /bin/bash

IP_ADDR=212.111.197.51
PORT=2222

login=is3205

echo "Uploading files to KPI cluster...($pass)"

for file in *.c; do
  	scp -P $PORT $file $login@$IP_ADDR:$1
	echo File: $file was uploaded to $1;
done

for file in *.sh; do
  	scp -P $PORT $file $login@$IP_ADDR:$1
	echo File: $file was uploaded to $1
done
