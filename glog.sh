#! /bin/bash
# Simple script to number git log output (for use with reset.sh script)
#
# $1 arg is the number of commits you'd like to print, i.e.,
# $ ./glog.sh 5

git log -$1 --oneline --no-abbrev-commit | nl
