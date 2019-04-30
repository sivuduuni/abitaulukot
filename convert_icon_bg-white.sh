#!/bin/sh

# Scale icons. See Makefile

if [ -f $2 ]; then
  rm $2
fi

#convert $1 -density 300 -background none -resize $3 -gravity center -extent $3 $2
inkscape --export-png=$2 \
	--export-dpi=200 \
	--export-background="#ffffff" \
	--export-background-opacity=255 \
	--export-width=$3 --export-height=$3 \
	--without-gui $1
