#!/bin/bash
# This may well only run on MacOS...
echo "Device Chosen:" $1
if [$1 != ""]
	then
	echo "Failure: No device specified"
	diskutil list | grep disk*
	exit
fi
# Unmount all partitions of device
for n in /dev/$1*
	do umount $n
done
# Gain root access
if [[ `whoami` != "root" ]] ; then
	echo "This script must be run as root (or using sudo). Exiting!"
	exit 1
fi
# Copy, and perform a compression of the copied information
echo "Starting DD, please wait for completion.."
dd if=/dev/$1 of=/dev/stdout bs=1m | bzip2 > compressed_$1.zip
echo "DD completed!"