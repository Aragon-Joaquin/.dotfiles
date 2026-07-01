setxkbmap latam &
xwallpaper --focus $HOME/Pictures/i_messed_up.jpg &

xcompmgr -c &
brightnessctl set 20%

dwmstatus &
start-pulseaudio-x11 &

exec dbus-run-session dwm
