#/bin/bash

BACKGROUND=$1
LOGO=$2
OUT="./output_$(date +%H%M).png"

ffmpeg \
	-i $BACKGROUND \
	-i $LOGO \
	-filter_complex \
		"[1][0]scale2ref=w=oh*mdar:h=ih/10[wm][v]; \ 
		 [v][wm] overlay=x=main_w-overlay_w-10:y=main_h-overlay_h-10" \
	$OUT;
