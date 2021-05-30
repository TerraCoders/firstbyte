#! /bin/bash

# Use stat to print octal and rwx permissions on files in a directory
# if argument unset, show permissions for contents of current directory
# if 'h' argument is passed, include hidden files
# otherwise, pass argument to stat as filepath
if [ -z ${1} ]; then
  stat -c "%a %A %n" *
elif [ "$1" = h ]; then
  stat -c "%a %A %n" .* *
else
  stat -c "%a %A %n" "$1"
fi
