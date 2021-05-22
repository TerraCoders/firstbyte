#! /bin/bash
# https://terracoders.com/blog/bash-simple-script-copying-files-and-directories-scp
# Script for passing fixed destinations to SCP command
# Aliased as scpr, [$1] variable is SCP destination; [$2] var is source folder path.
# usage example:
# $ scpx [$1] [$2]
# $ scpx remote folder
# $ scpx local /full/pathto/source/folder

# Store destination users, addresses and paths in variables
remote="user@example.com:/pathto/destination"
device="user@192.168.0.1:~/pathto/destination"

# Parse any source folder path to isolate the folder name
folder="$(basename $2)"

[ "$1" == remote ] && scp -r "$2"  "$remote"/"$folder"
[ "$1" == device ] && scp -r "$2" "$device"/"$folder"



