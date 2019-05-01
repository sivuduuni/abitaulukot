#!/bin/sh

# Scale icons. See Makefile

if [ -f $2 ]; then
  rm $2
fi

TEMPICON=`tempfile --suffix=.png`
TEMPBG=`tempfile --suffix=.png`
SCALEDPX=`echo "define trunc(x) { auto s; s=scale; scale=0; x=x/1; scale=s; return x } trunc($3 * 0.7)" | bc -l`

# Resize icon to 90% of the desired size
inkscape --export-png=$TEMPICON \
	--export-dpi=200 \
	--export-background="#ffffff" \
	--export-background-opacity=255 \
	--export-width=$SCALEDPX --export-height=$SCALEDPX \
	--without-gui $1

# Scale white background to the desired size
convert -resize $3x$3 icon/white_100x100.png $TEMPBG

# Merge background and icon
convert $TEMPBG $TEMPICON -gravity center -composite -format png -quality 100 $2

rm $TEMPICON
rm $TEMPBG
