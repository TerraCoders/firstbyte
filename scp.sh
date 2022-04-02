#! /bin/bash

# This script requires a text file containing SSH destinations in order to function
# This text file should be kept at ~/Scripts/src/ssh.txt

# If you decide to place it elsewhere, be sure to update the 'src' variable in this
# script accordingly.

# ******************
# ssh.txt formatting
# ******************

# EXAMPLE: https://github.com/TerraCoders/firstbyte/blob/master/src/ssh.txt

# You need to format your file in three columns, each column delimited with a SINGLE space.
# First column: 'username@address'
# Second column: ':/path/at/destination'
# Third column: 'simple name or alias for destination' <-- just in case you have trouble recognizing addresses

# You do not need any extra/empty lines other than the lines in your columns. Here is how
# the contents of your file might look:

# username@example.com :/path/to/uploads ExampleSite
# username@192.168.0.XX :~/Documents LocalComputer1
# username@192.168.0.YY :~/Shared LocalComputer2

# If you are running a local VM with VirtualBox, you can also scp to that VM with this script
# assuming you have Port Forwarding and openssh-server setup for your instance. In the case of a VM,
# however, the script needs to know which local port to connect to: i.e., 'scp -P XXXX'. There is an
# if statement at the bottom of this script that is meant to catch attempts to connect to a local
# VM and adjust scp protocol accordingly. Update according to your use.

# ************
# Dependencies
# ************

# lolcat
# xdotool


# store printed contents of ssh.txt
src="$(cat ~/Scripts/src/ssh.txt)"

# terminate the script if user is trying to use command on a directory
[ -d "$1" ] && echo "Cannot use this command with a directory. Please use the [scpr filename] command instead" && xdotool type "scpr $1" && exit

echo "Which host would you like to connect to? (select number)" | lolcat
# format src var and echo output
host="$(echo "$src" | cut -d " " -f 1)"
list="$(echo "$src" | cut -d " " -f 1,3)"
echo "$list" | nl
# format destination paths from ssh.txt
path="$(echo "$src" | cut -d " " -f 2)"
# select host by number
read line

# convert selection number for use w/ array
num="$(expr $line - 1)"

# take host var values and place in array
hosts=( $(echo $host) )
# extract array object by selected host number and store in var
whichhost="${hosts[$num]}"
# take path var values and place in array
paths=( $(echo $path) )
# extract arry object by selected host number and store in var
whichpath="${paths[$num]}"

#combine host and path into one var
destination="$(echo $whichhost$whichpath)"

file="$(basename $1)"

echo "Sending file $file to $destination..."

# if VM (6) selected, add port option, otherwise no port option
# if no VM, or no connection via local port, REMOVE everything on this line up to and including the OR opperator
[ "$line" == 6 ] && scp -P 2222 "$1" "$destination"/"$file" || scp "$1"  "$destination"/"$file"

