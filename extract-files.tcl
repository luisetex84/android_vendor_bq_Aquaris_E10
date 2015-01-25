#!/usr/bin/tclsh

set filer [open "propietary-files.txt" {RDONLY}]
set files [list]
while {[gets $filer linea]!=-1} {
  lappend files $linea
}
close $filer
for {set i 0} {$i<[llength $files]} {incr i} {
  puts "Pulling [lindex $files $i]"
  catch {exec adb pull /system/[lindex $files $i] propietary/[lindex $files $i]} result
  puts $result
}

