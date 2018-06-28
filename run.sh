#!/bin/bash

pd=/Users/Guest/Downloads/Pd-0.48-1.app/Contents/Resources/bin/pd

cd ./bin

printing=1
instruments="0 1 2"
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

for i in $instruments ; do
	randy
	$pd -send ";listen-port-set $i;titled-set $titled;layout-set $layout;limit $limit;instrument $i;print-and-save-set $printing;seed $seed" -open "$pdfile" &
	sleep 2
done
$pd -open controller.pd
