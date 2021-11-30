#! /bin/bash

# connect to remote host (don't expand variables)
ssh user@192.168.0.XX << 'EOF'
# create a random number
num="$(echo $RANDOM)"
# store new level name based on random number as a string
new="level-name=$num"
# find the line number in server.properties that defines level name
line="$(awk 'level-name/{print NR}' /serverfiles/server.properties)"
# delete existing level name at line number and replace with $new 
sed -i "${line}d" /serverfiles/server.properties && sed -i "${line}i ${new}" /serverfiles/server.properties
EOF
