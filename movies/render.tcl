# this script assumes you have a directory called "images"
# already created, so be sure to do so

set i 0
for {set fr 4800} {$fr < 5000} {incr fr} {
    animate goto $fr
    if {$i<10} {
        set fn 00${i}
    } elseif {$i>=10 && $i<100} {
        set fn 0${i}
    } else {
        set fn $i
    }
    render Tachyon images/$fn "/usr/local/lib/vmd/tachyon_LINUXAMD64 -aasamples 12 %s -o %s.tga"
    file delete images/$fn
    incr i
}

exit
