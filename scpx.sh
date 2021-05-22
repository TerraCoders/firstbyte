#! /bin/bash
# https://terracoders.com/blog/bash-simple-script-copying-files-and-directories-scp
# Script for passing fixed destinations to SCP command
# Aliased as scpx, [$1] variable is SCP destination; [$2] var is source file path.
# usage example:
# $ scpx [$1] [$2]
# $ scpx remote file.txt
# $ scpx local /full/pathto/source/file.txt

# Store destination users, addresses and paths in variables
remote="user@example.com:/pathto/destination"
device="user@192.168.0.1:~/pathto/destination"

# Parse any source file path to isolate the file name
file="$(basename $2)"

[ "$1" == remote ] && scp "$2"  "$remote"/"$file"
[ "$1" == device ] && scp "$2" "$device"/"$file"
