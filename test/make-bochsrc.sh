#!/bin/bash

###############################################################################
#
# SCRIPT TO GENERATE BOCHSRC
#
###############################################################################

. ../include.sh
. include-config.sh

echo "make-bochsrc!!!" 1>&2
pwd 1>&2

cat <<END
###############################################################################
#
# AUTOMATICALLY GENERATED BOCHSRC
#
# Do not edit this file.
# Instead, edit config.sh and run ./make-bochsrc or make bochsrc to update
#
###############################################################################

display_library: sdl

# ROM (BIOS) image
romimage: $ROMIMAGE

# ROM (VGA) image
vgaromimage: $VGAIMAGE

# How much memory to give our machine
megs: $MEMORY

# Disk image
ata0: enabled=1, ioaddr1=0x1f0, ioaddr2=0x3f0, irq=14
ata0-master: type=disk, path="disk.img", mode=flat, cylinders=$DISK_CYLINDERS, heads=$DISK_HEADS, spt=$DISK_SECTORS_PER_TRACK

# Boot order
boot: disk

# Processor
cpu: count=1, ips=1000000
clock: sync=none, time0=946681200 # jan 1, 2000

END
