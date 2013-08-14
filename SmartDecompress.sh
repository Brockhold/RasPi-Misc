#!/bin/bash
# This may well only run on MacOS...
echo "Device Chosen: $1"
echo "File Chosen: $2"
if [[ "$1" == "" ]] || [[ "$2" == "" ]]
	then
	echo "Failure: No device/input specified"
	exit
fi
# Gain root access
if [[ `whoami` != "root" ]] ; then
	echo "This script must be run using sudo!"
	exit 1
fi
# Unmount all partitions of device
for n in $1s*
	do umount $n
done
# Copy, and perform a compression of the copied information
echo "Starting DD, please wait for completion.."
bzip2 -dc $2 | dd if=/dev/stdin of=$1 bs=1m
echo "DD completed!"