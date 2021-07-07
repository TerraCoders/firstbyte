#! /bin/bash

[ "$1" == d ] && alias='@.dev'
[ "$1" == t ] && alias='@.test'
[ "$1" == p ] && alias='@.prod'

docroot="$(pwd | grep "docroot")"

if [ "$docroot" == "" ] && [ "$1" != d ] && [ "$1" != t ] && [ "$1" != p ]; then
  cd /var/www/pathto/docroot
  echo "You need to pass an enironment alias: (d)ev, s(t)age, or (p)rod"
elif [ "$1" != d ] && [ "$1" != t ] && [ "$1" != p ]; then
  echo "You need to pass an enironment alias: (d)ev, s(t)age, or (p)rod"
else
  sudo -u www-data /var/www/pathto/docroot/vendor/drush/drush/drush "$alias" cr
fi
