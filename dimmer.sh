#! /bin/bash
# Script for adjusting display brightness and gamma. Feed the script a value
# between 1-10 to affect brightness. Gamma is a fixed night mode value with reduced
# blue gamma.
# Usage:
# $ ./dimmer.sh 7 night
# $ ./dimmer 10

# Take whole numbers and convert to decimal for xrandr
if [ "$1" = 10 ]; then
  percent="1"
else
  percent="0.$1"
fi

# adjust brightness
xrandr --output DP-2 --brightness "$percent" && xrandr --output HDMI-1 --brightness "$percent"

# if night option passed adjust both brightness and gamma
if [ "$2" = night ]; then
  xrandr --output DP-2 --brightness "$percent" --gamma 1.0:0.95:0.85 && xrandr --output HDMI-1 --brightness "$percent" --gamma 1.0:0.95:0.85
else
  xrandr --output DP-2 --brightness "$percent" --gamma 1.0:1.0:1.0 && xrandr --output HDMI-1 --brightness "$percent" --gamma 1.0:1.0:1.0
fi

# Optional -  double check settings
xrandr --verbose | grep Brightness
xrandr --verbose | grep Gamma

# Optional
if [ "$1" != 10 ]; then
  cowsay "Stayin' up late, huh? Or maybe just pretneding to be a hacker?" | lolcat
fi
