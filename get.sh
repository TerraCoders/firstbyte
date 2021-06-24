#! /bin/bash
# Script to determine whether an application is running; if running bring the window to the front
# otherwise open the application independent of the terminal. This only works with applications
# that can be run from the command line. $1 arg is the name of the application you'd like to fetch.
#
# Usage example:
# ./get.sh firefox
# ./get.sh gitkraken

# grep xwininfo to determine whether an application has a window open
isopen="$(xwininfo -root -children | grep -i $1)"

# if application has a win open, bring to front (also redirect STDERR ouput to /dev/null). Else, open the requested app
[ "$isopen" != "" ] && xdotool search --desktop 0 $1 windowactivate 2> /dev/null || $1 </dev/null &>/dev/null &
exit
