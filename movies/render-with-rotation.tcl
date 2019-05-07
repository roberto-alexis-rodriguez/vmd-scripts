# this script assumes you have a directory called "images"
# already created, so be sure to do so

set i 0
set startframe 300
set endframe 500
set numFrames [expr $endframe-$startframe]
for {set fr $startframe} {$fr < $endframe} {incr fr} {
    animate goto $fr
    if {$i<10} {
        set fn 00${i}
    } elseif {$i>=10 && $i<100} {
        set fn 0${i}
    } else {
        set fn $i
    }
    # rendering
    render Tachyon images/$fn "/usr/local/lib/vmd/tachyon_LINUXAMD64 -aasamples 12 %s -o %s.tga"
    file delete images/$fn
    incr i

    # rotating
    set rot [expr 2*180.0/$numFrames]
    rotate y by $rot

}

exit
