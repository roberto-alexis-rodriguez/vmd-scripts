#!/bin/bash

str1=7.4/images/000.tga
str2=5.5/images/000.tga

if [ ! -d images ]; then
    mkdir images
    printf "\nCreated directory "images" to store merged files\n\n"
fi

for i in {0..149}; do
    if [ $i -lt 10 ]; then
        j=00$i
    elif [ $i -ge 10 ] && [ $i -lt 100 ]; then
        j=0$i
    elif [ $i -ge 100 ]; then
        j=$i
    fi

    echo "Working on $i"

    str1_new=7.4/images/$j.tga
    str2_new=5.5/images/$j.tga
    label1="AQP10 pH7.4"
    label2="AQP10 pH5.5"

    if [ "$1" = "im" ]; then
        convert -frame 0x50 -mattecolor White -gravity North -annotate +0+30 "$label1" -pointsize 36 $str1_new images/${j}a.png
        convert -frame 0x50 -mattecolor White -gravity North -annotate +0+30 "$label2" -pointsize 36 $str2_new images/${j}b.png
        montage images/${j}a.png images/${j}b.png -geometry +0+0 images/$j.png
        rm images/${j}a.png
        rm images/${j}b.png

    elif [ "$1" = "inkscape" ]; then
        # we need ../ because the svg is saved inside images/
        sed "s|$str1|../$str1_new|g" base.svg > images/$j.svg
        sed -i "s|$str2|../$str2_new|g" images/$j.svg
        inkscape -d 300 images/$j.svg --export-area-page -e images/$j.png 
        rm images/$j.svg

    else
        printf "\nPlease specify a merging method ("im" or "inkscape")\n"
        printf "If using "inkscape" please have a base.svg file defining\nhow to setup the merging\n\n"
        exit 1

    fi

done
