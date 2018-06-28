#!/bin/bash

INPUTDIR=$1

cd ./output/$INPUTDIR	

OUTPUT=$1-score.pdf

instruments="BASS_FLUTE TRUMPET VIOLA"



for i in $instruments
do
	for j in {0..19}
	do
		# gs -sDEVICE=pdfwrite -sOutputFile="$OUTPUT" -dNOPAUSE -dEPSCrop -c "<</Orientation 2>> setpagedevice" -sPAPERSIZE=a3  -f $i-$j.ps -c quit
		
		# ls $i-$j.ps
		# echo "$instrument"
	done
done