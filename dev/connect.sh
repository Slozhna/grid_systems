#! /bin/bash

IP_ADDR=212.111.197.51
PORT=2222

login=is3205

echo "Establishing connection to KPI cluster...($pass)"
ssh $login@$IP_ADDR -p $PORT
