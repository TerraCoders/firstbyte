#! /bin/bash
# Script for grabbing a commit from git log and passing the hash to git reset
# Usage: you need to know how many commits back you'd like to reset to. You
# can pass that number as a variable to the script or simply reset to the last
# commit in your history, i.e.:
# ./reset.sh 3
# ./reset.sh last
#
# The first usage would reset to the third commit in your git log history.
# The second usage would reset to the second commit in your git log history.

# if inline var equals last create num var and give value of two
# otherwise, num var equals inline var
if [ "$1" = last ]; then
  num="2"
else
  num="$1"
fi

# parse git log ouput and store the commit hash in hash var
hash=$(echo "$(git log -$num | grep commit | cut -b 8-)" | tail -n1)

# sanity check
echo "Hard reset to $hash ?" | lolcat

# prompt
read yn

# if yes, reset -- otherwise commence ridicule
[ "$yn" = y ] && git reset --hard $hash || echo "Chicken?" | lolcat
