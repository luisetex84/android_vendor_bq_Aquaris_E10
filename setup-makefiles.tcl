#!/usr/bin/tclsh

set filer [open "propietary-files.txt" {RDONLY}]
set files [list]
while {[gets $filer linea]!=-1} {
  lappend files $linea
}
close $filer

set filew [open "kaito_wifi-vendor-blobs.mk" {WRONLY CREAT TRUNC}]
puts $filew "PRODUCT_COPY_FILES += \\"

set ori "vendor/bq/kaito_wifi/propietary/"
set des ":system/"
for {set i 0} {$i<[expr {[llength $files]-1}]} {incr i} {
  puts $filew "\t$ori[lindex $files $i]$des[lindex $files $i] \\"
}
puts $filew "\t$ori[lindex $files $i]$des[lindex $files $i]"

close $filew
