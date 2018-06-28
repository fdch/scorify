#!/bin/bash

INPUTDIR=$1

cd ./output/$INPUTDIR	

instruments="BASS_FLUTE TRUMPET VIOLA"



for i in $instruments
do
	OUTPUTFILE="$INPUTDIR-$i.pdf"
	for j in {0..19}
	do
		 gs -sDEVICE=pdfwrite -sOutputFile="$OUTPUTFILE" -dNOPAUSE -dEPSCrop -c "<</Orientation 2>> setpagedevice" -sPAPERSIZE=a3  -f "$i-$j.ps" -c quit
	done
done