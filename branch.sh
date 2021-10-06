#! /bin/bash
# quick script for making branch creation a bit easier
# usage: $ ./branch.sh branchname
#        $ ./branch.sh

# get current branch name and parse with cut
# you may need to adjust cut command for your shell
current="$(git branch | grep "*" | cut -b 3-)"

# if arg is not set
if [ -z "${1}" ]; then
  echo "Name of new branch?"
  read branch

  echo "Create $branch from $current (c) or from Master (m)?"
  read -p "current(c) / Master(m) ?" cm
  [ $cm == 'c' ] && git checkout -b $branch
  [ $cm == 'm' ] && git checkout master && git pull origin master && git checkout -b $branch
#otherwise use $1 arg as branch name
else
 echo "Create $1 from $current (c) or from Master (m)?"
  read -p "current(c) / Master(m) ?" cm
  [ $cm == 'c' ] && git checkout -b "$1"
  [ $cm == 'm' ] && git checkout master && git pull origin master && git checkout -b "$1"
fi
