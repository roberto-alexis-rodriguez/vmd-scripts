# vmd-scripts
Scripts for analysis using VMD

## movies
Create simple trajectory movies by rendering a series of molecular graphics and then putting them together using `ffmpeg`.
You should generate a "vmd scene" file to set the visualization options.
The file `movie.tcl` will call this file (`scene.vmd` by default) before starting the image rendering.
There is also a render script `render-with-rotation.tcl` which will rotate the view about an axis as the trajectory progresses.
