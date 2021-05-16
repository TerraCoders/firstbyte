#! /bin/bash
# https://terracoders.com/blog/git-add-commit-and-push-all-once-bash-function
# git add, commit and push all at the same time.

function addcommitpush () {

# dtermine current branch
current=$(git branch | grep "*" | cut -b 3-)

#wrap inline var in single quotes and store in var called message
message=\'"$@"\'
#git add and pass message var to git commit
git add -A && git commit -a -m "$message"

echo "Where to push?" | lolcat
#prefill current branch and prompt var to store a push branchname
read -i "$current" -e branch
#last chance before push -- prefill yes
echo "You sure you wanna push? (y/n)" | lolcat
read -i "y" -e yn

if [ "$yn" = y ]; then
  git push origin "$branch"
else
  echo "Have a nice day!" | lolcat
fi

}
#pass inline variable to function and run
addcommitpush $1
