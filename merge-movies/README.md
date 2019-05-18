This script (`patching.sh`) merges two sets of images
for later processing into a video/gif/etc.
It assumes the images are in two separate 
directories and have a naming scheme like

000.tga, 001.tga, ..., 009.tga, 010.tga, ..., 120.tga, ...

and then the corresponding images from each directory
will get placed side by side. The variables you are
most likely to want to change are 

* `str1`/`str1_new`
* `str2`/`str2_new` 
* `label1`/`label2`

There are two options to merge them, one involving
`Inkscape` (pass "inkscape" as a commandline arg) and
one involving `ImageMagick` ("im").

# `Inkscape`
If using `Inkscape`, make sure to prepare a template svg
file where you link (NOT embed) the images pointed to 
by `str1` and `str2`. The script will then create
new svgs from the template by replacing `str1` and `str2`
and export them into png.
This offers a lot of flexibility to add arbitrary text, etc
to the template, but the rendering is a little slow.

# `ImageMagick`
If using `ImageMagick`, the default will add a
text label to each image before merging them.
This rendering is much faster than using `Inkscape`, 
but customizing any text, etc on the images
probably takes more trial-and-error.
