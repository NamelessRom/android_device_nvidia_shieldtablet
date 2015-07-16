#!/sbin/busybox sh
export TOUCH_CONF_DIR=/mnt/factory/touchscreen
LD_LIBRARY_PATH=/sbin/touchscreen:/system/lib:/system/lib/hw /sbin/touchscreen/rm-wrapper
