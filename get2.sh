#! /bin/bash
# Script to determine whether an application is running; if running bring the window to the front
# otherwise open the application independent of the terminal. This only works with applications
# that can be called from the command line.
#
# In the case of Firefox, I often have multiple windows open. In this case, the script will prompt
# you to select which of the open windows you'd like to bring to the front.
#
# $1 arg is the name of the application you'd like to fetch.
#
# Usage example:
# ./get.sh firefox
# ./get.sh gitkraken
if [ "$1" == ff ]; then
  alias='firefox'
elif [ "$1" == gk ]; then
  alias='gitkraken'
elif [ "$1" == vs ]; then
  alias='code'
elif [ "$1" == t ]; then
  alias='terminal'
else
  alias="$1"
fi

# grep xwininfo to determine whether an application has a window open
isopen="$(xwininfo -root -children | grep -i $alias)"

if [ "$isopen" != "" ] && [ "$1" == ff ]; then

  # use wmctrl to find open FF windows
  ff="$(wmctrl -l | grep Firefox)"

  # parse down to window name only
  all="$(echo "$ff" | cut -b 27-)"

  # and number the output
  list="$(echo "$all" | nl)"

  # prompt to select from open windows
  echo "Please select a window to open:" | lolcat
  echo "$list"
  read -p "Enter a number: " num

  # search list for num with grep and parse again
  window="$(echo "$list" | grep $num | cut -b 8-)"

  # use parsed window name to get a window ID with xdotool
  id="$(xdotool search --name ''"$window"'')"

  # BAM!
  xdotool windowactivate "$id"

else

  # if application has a win open, bring to front (also redirect STDERR ouput to /dev/null). Else, open the requested app
  [ "$isopen" != "" ] && xdotool search --desktop 0 $alias windowactivate 2> /dev/null || $alias </dev/null &>/dev/null &
  exit

fi