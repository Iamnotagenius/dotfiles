#xmodmap -e "keycode 135 = Super_R"

#eval $(gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK

xbindkeys
numlockx &
unclutter -idle 3 &
exec xrdb ~/.Xresources &
slstatus &
picom &
dunst &

xwallpaper --daemon --center ~/Pictures/girl.png
#xwinwrap -ov -g 1920x1080+0+0 -ni -b -nf -un -- mpv -wid WID --loop --no-audio -fs ~/Pictures/Wallpapers/Ori.mp4 & 
#xwinwrap -ov -g 1920x1080+1440+0 -ni -b -nf -un -- mpv -wid WID --loop --no-audio -fs ~/Pictures/Wallpapers/Ori.mp4 & 
#xwinwrap -ov -g 1440x900+0+180 -ni -b -nf -un -- mpv -wid WID --loop --no-audio -fs --video-scale-y=1.1 --video-scale-x=1.1 ~/Pictures/Wallpapers/MikoFox.mp4 &

rm /tmp/dwm.fifo
touch /tmp/dwm.fifo

exec dwm
