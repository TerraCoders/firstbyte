#! /bin/bash
# Script to determine whether an application is running; if running bring the window to the front
# otherwise open the application independent of the terminal. This only works with GUI applications
# that can be launched from the command line. $1 arg is the name of the application you'd like to fetch.

# Usage example:
# ./get.sh firefox
# ./get.sh gitkraken

# create a few aliases for often used apps and translate to $2 value
if [ "$1" == ff ]; then
  alias='firefox'
elif [ "$1" == gk ]; then
  alias='gitkraken'
elif [ "$1" == vs ]; then
  alias='code'
elif [ "$1" == ev ]; then
  alias='evolution'
else
  alias="$1"
fi

# grep xwininfo for $alias val to see if app is already open; if so, get window, if not, open app w/ alias val
isopen="$(xwininfo -root -children | grep -i $alias)"
[ "$isopen" != "" ] && xdotool search --desktop 0 $alias windowactivate 2> /dev/null || $alias </dev/null &>/dev/null &
#exit
