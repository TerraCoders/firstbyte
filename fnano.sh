#! /bin/bash

#arg $1 is term
#arg $2 is file path
#grep for term, add line numbers to ouptut and place in var
matches="$(grep -n $1 $2)"

echo "The folowing line numbers match:" | lolcat
echo ""
echo "$matches"
echo ""
echo "Which line would you like to jump to? (ctl-c to abort)" | lolcat
#input line number
read line

#open nano to file line number accordingly
nano +"$line" "$2"
