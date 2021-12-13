#! /bin/bash

# Script to automate deletion of server plugins on a remote MineCraft Server.
# You will need to know your MC Server's IP address, user and password; the plugins  
# folder location also assumes you are using the Java (paper.jar) version of the server 
# (in my case built on balenaCloud/balenaOS). Update the script for these items accordingly.

# USAGE: ./delete.sh

# connect to remote host (don't expand variables)
ssh root@192.168.0.XX << 'EOF'

echo "*******************"
echo "* Listing Plugins *"
echo "*******************"

# list files in plugins
ls /serverfiles/plugins

EOF

echo "Which plugin would you like to remove?" | lolcat
echo "Enter the case-sensitive name (without .jar ending or version numbers):"

read plugin

echo "You are about to remove the $plugin folder and the $plugin .jar file."
echo "*****************************************************"
echo "* This is a destructive action; you cannot undo it! *" | lolcat
echo "*****************************************************"
echo "Would you like to proceed? (y/n)"

read yn

if [ "$yn" == n ]; then
  exit
else
# lets send our variables to remote
export plugin
export folder="/serverfiles/plugins/$plugin"
# Here things get a little crazy:
# I use grep to find the plugin .jar file since the file names can sometimes
# be convoluted (i.e., they have a bunch of version numbers in the name).
ssh root@192.168.0.XX 'bash -s' << EOF
rm -rf $folder && rm /serverfiles/plugins/\$(ls /serverfiles/plugins | grep $plugin | grep .jar)
ls /serverfiles/plugins
EOF
fi

# line below is optional; I include it for my kids--so they enjoy running the script a little more.
jp2a ~/Scripts/src/minecraft.jpg --invert --term-fit | lolcat && cowsay "$plugin has been removed from your MineCraft Server!" | lolcat


