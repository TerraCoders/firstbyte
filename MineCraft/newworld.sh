#! /bin/bash

# SCRIPT NOT YET TESTED...

# Script for automating creation of new worlds on your MC Server (paper.jar)
# To create a new world, you would normally open your server's server.properties file
# and edit the 'level-name' line. This script ssh'es into your server, uses AWK to find that
# line, and then uses SED to replace the line with a new 'level-name' value based on a
# random number.

# The script could be adapted to prompt the user for a new level-name with 'read'; just be sure
# export the 'read' variable for use on remote.

# USAGE: ./newworld.sh

# connect to remote host (don't expand variables)
ssh user@192.168.0.XX << 'EOF'
# create a random number
num="$(echo $RANDOM)"
# store new level name based on random number as a string
new="level-name=$num"
# find the line number in server.properties that defines level name
line="$(awk '/level-name/{print NR}' /serverfiles/server.properties)"
# delete existing level name at line number and replace with $new
sed -i "${line}d" /serverfiles/server.properties && sed -i "${line}i ${new}" /serverfiles/server.properties
EOF
