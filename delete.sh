#! /bin/bash

# connect to remote host (don't expand variables)
ssh root@192.168.0.XX << 'EOF'

echo "*******************"
echo "* Listing Plugins *"
echo "*******************"

# list files in plugins
ls /serverfiles/plugins

EOF

echo "Which plugin would you like to remove?" | lolcat
echo "Enter the case-sensitive name (without .jar ending):"

read plugin

echo "You are about to remove the $plugin folder and the $file file."
echo "*****************************************************"
echo "* This is a destructive action; you cannot undo it! *" | lolcat
echo "*****************************************************"
echo "Would you like to proceed? (y/n)"

read yn

if [ "$yn" == n ]; then
  exit
else

# export variables for use on remote
export plugin
# path to folder and file
export folder="/serverfiles/plugins/$plugin"
export file="/serverfiles/plugins/$plugin.jar"
ssh root@192.168.0.19 'bash -s' << EOF
rm -rf $folder && rm $file
ls /serverfiles/plugins
EOF
fi

# celebration!
jp2a ~/Scripts/src/minecraft.jpg --invert --term-fit | lolcat && cowsay "$plugin has been removed from your MineCraft Server!" | lolcat


