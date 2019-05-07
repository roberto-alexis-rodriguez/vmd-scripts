#!/bin/bash

# you may change the Constant Rate Factor (crf)
# to be larger than 18 to get smaller filesizes in exchange
# for reduced quality. No compression at all is -crf 0, but
# that tends to produce enormous movies if the underlying images
# are already large

ffmpeg -framerate 24 -i images/%03d.tga -c:v libx264 -profile:v high -crf 18 -pix_fmt yuv420p -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" movie.avi
