#! /bin/bash

# script to automate clearing remote caches with drush site-aliases.
# you will need to have functioning drush site aliases. This script also
# checks to ensure you're in your Drupal root when running the script;
# this is useful if you run Drush from your Drupal root; be sure to adjust the
# path to your Drupal root appropriately. You will also need to have xdotool
# installed.

# USAGE:

# ./dcr.sh d (to clear cache on dev)
# ./dcr.sh t (to clear cache on stage/test)
# ./dcr.sh p (to clear cache on prod)

# current directory path
path="$(pwd)"

# make sure path includes docroot
check="$(echo $path | grep docroot)"

# if path is correct and argument has a value
if [ "$check" != "" ] && [ -n "$1" ]; then

  # determine which alias to use
  [ "$1" == d ] && drush @sitename.dev cr
  [ "$1" == t ] && drush @sitename.test cr
  [ "$1" == p ] && drush @sitename.prod cr

# if path incorrect but argument has value
elif [ "$check" == "" ] && [ -n "$1" ]; then

  echo "This script can only be run from your project docroot!" | lolcat
  echo "Changing directories now..."

  # change directory to docroot
  cd /pathto/Drupal/root

  # determine which alias to use
  [ "$1" == d ] && drush @sitename.dev cr
  [ "$1" == t ] && drush @sitename.test cr
  [ "$1" == p ] && drush @sitename.prod cr

elif [ "$check" == "" ] && [ -z "$1" ]; then

  echo "This script can only be run from your project docroot!" | lolcat
  echo "Changing directories now..."

  # change directory to docroot
  cd /pathto/Drupal/root

  # redo
  echo "You didn't pass an argument to the script!" &&\
  echo "Please choose (d)ev, (t)est, or (p)rod" | lolcat &&\
  xdotool type dcr

elif [ "$check" != "" ] && [ -z "$1" ]; then

  # redo
  echo "You didn't pass an argument to the script!" &&\
  echo "Please choose (d)ev, (t)est, or (p)rod" | lolcat &&\
  xdotool type dcr

else
  echo "Something's amiss at the Circle K!" | lolcat
fi
