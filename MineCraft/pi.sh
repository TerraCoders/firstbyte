#! /bin/bash

# script for automating scp file transfers to Java version RPi MC Server (paper)

#########
# USAGE #
#########

# example: ./pi.sh ~/path/to/file.jar
# example: ./pi.sh file.jar

# Local or remote RPi address
# Change [user] to whatever user you log in as
host="user@XXX.XXX.X.XX"

# Path to RPi plugins folder
# Most transfers go to the plugins folder, but you can play with path as necessary;
# You might even print a list of destinations and then select one with read
path=":/serverfiles/plugins"

# store $host and $path in a single variable
destination="$(echo $host$path)"

# test if file actually exists
if [ -f "$1" ]; then

  echo "Sending $1 to your MineCraft Server"
  # remove path and isolate file name
  file="$(basename $1)"
  # use scp to send file
  scp "$1" "$destination"/"$file" && jp2a ~/Scripts/src/minecraft.jpg --invert --term-fit | lolcat && cowsay "$file has been sent to $destination." | lolcat

else

  echo "It looks like that file-name does not exist. Are you sure you typed the name correctly?"
  # exit with error code
  exit 1

fi
