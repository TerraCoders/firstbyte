#! /bin/bash

# Script for automating scp file transfers to Java version RPi MC Server (paper.jar)
# In my case, this script is set up to pass files to the server's plugins folder--since  
# most of the files that ever need to be send to the server are plugins. You will need to know
# your server's IP address, user and password. You will also want to confirm the path to your 
# plugins folder (if you intend to use the script for plugins).

#########
# USAGE #
#########

# example: ./pi.sh ~/path/to/somefile.jar
# example: ./pi.sh somefile.txt

# IF USING TO TRANSFER PLUGINS OR SERVER FILES, BE SURE TO RESTART MC-SERVER SERVICE AFTER USE

# Local or remote RPi address
# Change [user] to whatever user you log in as
host="user@XXX.XXX.X.XX"

# Path to RPi plugins folder
# Most of my transfers go to the plugins folder, but you can play with path as necessary;
# You might even print a list of destinations and then select one with read
path=":/serverfiles/plugins"

# store $host and $path in a single variable
destination="$(echo $host$path)"

# test if file actually exists
if [ -f "$1" ]; then

  echo "Sending $1 to your MineCraft Server"
  # remove path and isolate file name
  file="$(basename $1)"
  # use scp to send file (from the second command is optional--I use jp2a, cowsay and lolcat for my kids
  scp "$1" "$destination"/"$file" && jp2a ~/Scripts/src/minecraft.jpg --invert --term-fit | lolcat && cowsay "$file has been sent to $destination." | lolcat

else

  echo "It looks like that file-name does not exist. Are you sure you typed the name correctly?"
  # exit with error code
  exit 1

fi
