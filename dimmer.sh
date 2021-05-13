#! /bin/bash
# set a value for brightness and toggle night mode (reduced blue gamma)
# example usage: ./dimmer.sh 7 night
#
# you can find the names of your displays by running xrandr --listactivemonitors
# I run two monitors so each command runs twice. My display names are DP-2 and 
# HDMI-1 -- replace  these with your own monitor names and play with --gamma values
# as you see fit.

# convert xrandr decimal values to whole numbers
if [ "$1" = 10 ]; then
  percent="1"
else
  percent="0.$1"
fi

# change brightness
xrandr --output DP-2 --brightness "$percent" && xrandr --output HDMI-1 --brightness "$percent"

# if night option passed toggle gamma accordingly
if [ "$2" = night ]; then
  xrandr --output DP-2 --gamma 1.0:0.95:0.85 && xrandr --output HDMI-1 --gamma 1.0:0.95:0.85
else
  xrandr --output DP-2 --gamma 1.0:1.0:1.0 && xrandr --output HDMI-1 --gamma 1.0:1.0:1.0
fi

# check that the values have actually changed
xrandr --verbose | grep Brightness
xrandr --verbose | grep Gamma

# optional...
if [ "$1" != 10 ]; then
  cowsay "Stayin' up late, huh? Or maybe just pretneding to be a hacker?" | lolcat
fi
