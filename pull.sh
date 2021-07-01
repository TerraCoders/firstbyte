#! /bin/bash

current="$(git branch | grep "*" | cut -b 3-)"

echo "You are currently checked out on origin/$current" | lolcat

if [ "$current" == master ]; then
  echo "Push to origin/master (y)?"
  read -i "y" -e yn1
  [ "$yn1" == y ] && git pull origin master || echo "Fat fingers?"
else
  echo "Push to origin/$current (y)?"
  read -i "y" -e yn2
  [ "$yn2" == y ] && git pull origin $current || echo "Fat fingers?"
fi
