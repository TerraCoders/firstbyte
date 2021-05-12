#! /bin/bash

#find line number for commented verbose error logging
line=$(awk '/error_level/{print NR}' /pathto/settings.php)

#create var to store verbose error logging w/o comments
on="\$config['system.logging']['error_level'] = 'verbose';"

sed -i "${line}d" /pathto/settings.php && sed -i "${line}i ${on}" /pathto/settings.php
echo "Verbose error logging is now on!" | lolcat
