#! /bin/bash

IP_ADDR=212.111.197.51
PORT=2222

login=is3205

echo "Upload file to KPI cluster...($pass)"

scp -P $PORT $2 $login@$IP_ADDR:$1
echo File: $2 was uploaded to $1;
