#!/bin/bash

pd=/Users/Guest/Downloads/Pd-0.48-1.app/Contents/Resources/bin/pd

cd ./bin


titled=1
layout=3
limit=20

pdfile=main.pd

seed=10

randy () {
	local thedate=$(date +%s)
	local randome=$(( ( RANDOM % 100 ) + 1 ))
	seed=$((($thedate + $randome) % 20000))
}

randy
echo "$seed"
$pd -send ";listen 5000;titled-set $titled;layout-set $layout;instrument 0;limit $limit;seed $seed" -open "$pdfile" &
sleep 2
randy
echo "$seed"
$pd -send ";listen 5001;titled-set $titled;layout-set $layout;instrument 1;limit $limit;seed $seed" -open "$pdfile" &
sleep 2 
randy
echo "$seed"
$pd -send ";listen 5002;titled-set $titled;layout-set $layout;instrument 2;limit $limit;seed $seed" -open "$pdfile" &
sleep 2 
$pd -open controller.pd &
sleep 2
echo "
Ready to go"
