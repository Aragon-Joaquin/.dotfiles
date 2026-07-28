setxkbmap latam &
xwallpaper --focus $HOME/Pictures/aegis_v1.jpg &

xcompmgr -c &
brightnessctl set 50%

powerprofilesctl set balanced &

//disable both page up and page down CUZ I HATE THEM WITH MY LIFE
xmodmap -e "keycode 112=" 
xmodmap -e "keycode 117="

dwmstatus &
start-pulseaudio-x11 &

exec dbus-run-session dwm
