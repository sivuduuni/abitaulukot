#!/bin/sh

# Scale icons. See Makefile

if [ -f $2 ]; then
  rm $2
fi

inkscape --export-png=$2 \
	--export-dpi=200 \
	--export-background-opacity=0 \
	--export-width=$3 --export-height=$3 \
	--without-gui $1
