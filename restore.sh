#! /bin/bash

# DESCRIPTION:
#
# Drupal's package manager, Composer, overwrites .HTACCESS and ROBOTS.TXT files during updates/upgrades. This is a somewhat
# annoying behavior. You don't want to necessarily tell Composer to exclude these files from its updates; in the case of
# core updates, these files may receive essential security updates intended to harden the system. A good practice, then,
# is to keep your edits to these files separate and patch/append the files once Composer has updated them.
#
# This script will do exactly that. In order to work, you will need to have your htaccess and robots edits stored in supplementary
# files. You can keep them in your Drupal root (versioned with everything else), or anywhere outside. In my case, since my only
# htaccess edits are really only redirects, I keep these edits in file called REDIRECTS.TXT; my edits to the robots.txt file are
# kept in a file called DISALLOWS.TXT
#
# Since htaccess redirects need to be inserted at a specific point in my htaccess file (i.e., after "RewriteEngine on"), I use SED
# to search for a match in the line they need to be inserted after. The example below is intended to match for the pharse "target match";
# update the script according to your needs

# USAGE:
# $ ./restore.sh

# RESTORE .htaccess BY INSERTING REDIRECTS AFTER HTTP_AUTH LINE
sed -i '/target match/ r /path/to/redirects.txt' /path/to/.htaccess && echo ".htacces has been restored"

# RESTORE robots.txt BY APPENDING disallows.txt CONTENTS TO THE FILE
cat /path/to/disallows.txt >> /path/to/robots.txt && echo "robots.txt has been restored"

# RUN git diff AGAINST HEAD TO CONFIRM CHANGES
git diff --compact-summary HEAD
