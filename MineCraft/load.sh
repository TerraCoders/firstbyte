#! /bin/bash

# This is not a complete script. It's intended for use with a larger script allowing users to swap worlds on a MC server.
# It can be used as is, however, to load a new world on your server.
#
# USAGE:
# ./load.sh
#
# The minecraft world is set in the server.properties file. This script finds that line and rewrites it
# with read variabled defined by the script user. You can use this script to load an existing world on your server
# or create a new world.

echo "Name of world would you like to load/create? (case-sensitive)"
read world
# export variable for use on remote
export world

ssh root@balenaminecraftserver.local 'bash -s' << EOF
# no quotes on variables to avoid local shell expansion
echo $world
# use sed to find string in server.properties beginning with level-name
# .* regex includes all characters coming after level-name
sed -i 's/^level-name.*/level-name=${world}/g' /serverfiles/server.properties
# check that the file has been updated successfully
grep level-name /serverfiles/server.properties
EOF
