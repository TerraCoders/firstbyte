#! /bin/bash
# https://terracoders.com/blog/bash-simple-script-changing-display-brightness-xrandr
# Script for adjusting display brightness and gamma. Feed the script a value
# between 1-10 to affect brightness. Gamma is a fixed night mode value with reduced
# blue gamma.
# Usage:
# $ ./dimmer.sh 7 night
# $ ./dimmer 10

# Take whole numbers and convert to decimal for xrandr
[ "$1" = 10 ] && percent="1" || percent="0.$1"

# adjust brightness
xrandr --output DP-2 --brightness "$percent" && xrandr --output HDMI-1 --brightness "$percent"

# if night option passed adjust both brightness and gamma
if [ "$2" = night ]; then
  xrandr --output DP-2 --brightness "$percent" --gamma 1.0:0.95:0.85 && xrandr --output HDMI-1 --brightness "$percent" --gamma 1.0:0.95:0.85
else
  xrandr --output DP-2 --brightness "$percent" --gamma 1.0:1.0:1.0 && xrandr --output HDMI-1 --brightness "$percent" --gamma 1.0:1.0:1.0
fi

# Optional -  double check settings
echo "$(xrandr --verbose | grep Brightness)" | tail -n1
echo "$(xrandr --verbose | grep Gamma)" | tail -n1

# Optional
[ "$1" != 10 ] && echo "Stayin' up late, huh? Or maybe just pretneding to be a hacker?" | lolcat
