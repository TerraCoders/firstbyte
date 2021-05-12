#! /bin/bash
# A script to find verbose error logging in your Drupal settings.php file
# and turn it on. You need to have it there to begin with, commented out.
# having it commented out is good for when you hit the WSOD. With this script,
# you can rewrite the line without the '//' commenting it out.


#find line number for commented verbose error logging
line=$(awk '/error_level/{print NR}' /pathto/settings.php)

#create var to store verbose error logging w/o comments
on="\$config['system.logging']['error_level'] = 'verbose';"

sed -i "${line}d" /pathto/settings.php && sed -i "${line}i ${on}" /pathto/settings.php
echo "Verbose error logging is now on!" | lolcat
