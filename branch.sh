#! /bin/bash
# https://terracoders.com/blog/bash-simple-script-checking-out-new-git-branches
# An easy script for checking out new branches with git.
# The script asks for a new branch name, identifies the current branch
# and then asks whether you'd like to create the new branch for the (c)urrent branch
# or from (m)aster. Abort by entering any value other than C or M at the prompt

current="$(git branch | grep "*" | cut -b 3-)"

echo "Name of new branch?"

read branch

echo "Create $branch from $current (c) or from Master (m)?"
read -p "current(c) / Master(m) ?" cm
if [ $cm == 'c' ]; then
    git checkout -b $branch
elif [ $cm == 'm' ]; then
    git checkout master && git pull origin master && git checkout -b $branch
else
    echo "Fat fingers?" | lolcat
fi
