#! /bin/bash
# A script to find verbose error logging in your Drupal settings.php file
# and turn it on. You need to have it there to begin with, commented out.
# having it commented out is good for when you hit the WSOD. With this script,
# you can rewrite the line without the '//' commenting it out--effectively
# toggling it on.

# Usage:
# ./error.sh (to toggle verbose error logging on)
# ./erros.sh off (to toggle logging off)

# find line number for commented verbose error logging
line=$(awk '/error_level/{print NR}' /pathto/sites/default/settings.php)

# create var to store verbose error logging w/o comments
on="\$config['system.logging']['error_level'] = 'verbose';"

# create var to store verbose error logging w/ comments (to toggle error logging off)
off="//\$config['system.logging']['error_level'] = 'verbose';"

# if off arg is passed, rewrite verbose error logging line with $off var, otherwise, rewrite with $on var
if [ "$1" == off ]; then
  sudo sed -i "${line}d" /pathto/sites/default/settings.php && sudo sed -i "${line}i ${off}" /pathto/sites/default/settings.php && echo "Verbose error logging is now off!"
else
  sudo sed -i "${line}d" /pathto/sites/default/settings.php && sudo sed -i "${line}i ${on}" /pathto/sites/default/settings.php && echo "Verbose error logging is now on!"
fi
