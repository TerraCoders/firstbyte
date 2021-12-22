These Bash scripts are written for managing the Java (paper.jar) version of MineCraft Server (1.17+) built on
balenaCloud/balenaOS for the Raspberry Pi. 

I've specifically written these scripts to encourage my kids (currently 6th graders) to manage their
MC server. I use lolcat, jp2a and cowsay to keep things colorful and fun. You can either remove these
commands from the scripts or you can install them with apt. The image used in jp2a is the minecraft.jpg 
also available in this folder. 

NOTE: if you're running the Balena OS build for your server, it's important to realize that many of the folders
outside the /serverfiles directory DO NOT persist (a reboot will reload the last 'release' to which your 
installation corresponds). These scripts are thus largely intended for managing the /serverfiles directory ONLY.

Lastly, not all of the scripts here are fully tested. I build them in anticipation of my kids' needs; sometimes
I don't test the scripts until my kids need me to. Use with caution.
