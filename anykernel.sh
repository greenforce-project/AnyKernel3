# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

# Print LOGO
ui_print "    ____ _____                               ";
ui_print "   / ___|  ___|                              ";
ui_print "  | |  _| |       Stay Simple,               ";
ui_print "  | |_| |  _|                 Stay Naive     ";
ui_print "   \____|_|                                  ";
ui_print "   ____  ____   ___      _ _____ ____ _____  ";
ui_print "  |  _ \|  _ \ / _ \    | | ____/ ___|_   _| ";
ui_print "  | |_) | |_) | | | |_  | |  _|| |     | |   ";
ui_print "  |  __/|  _ <| |_| | |_| | |__| |___  | |   ";
ui_print "  |_|   |_| \_ \___/ \___/|_____\____| |_|   ";
ui_print "                                             ";
ui_print "                 Directed by:                ";
ui_print "                 Mhmmd Fdlyas                ";
ui_print "                 Zecho Satria                ";

## AnyKernel boot install
dump_boot;

# Remove ramdisk overlay if any
if [ -d \$ramdisk/overlay ]; then
    rm -rf \$ramdisk/overlay;
fi;

write_boot;
## end boot install
