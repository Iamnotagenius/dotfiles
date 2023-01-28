xrandr --output HDMI-A-0 --primary
xrandr --output DisplayPort-1 --pos 0x180

xmodmap -e "keycode 135 = Super_R"

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

xbindkeys
numlockx &
unclutter -idle 3 &
exec xrdb ~/.Xresources &
slstatus &
expicom --experimental-backends &
dunst &
udiskie &

xwallpaper --center ~/Pictures/Wallpapers/katana-zero.png

#export WALLPAPER_SOCKET=/tmp/mpvwallpaper
#xwinwrap -ov -g 1920x1080+0+0 -ni -b -nf -un -- mpv --no-terminal --no-input-cursor --no-osc -wid WID --loop --no-audio -fs --input-ipc-server=$WALLPAPER_SOCKET ~/Pictures/Wallpapers/Ori.mp4 & 
#xwinwrap -ov -g 1920x1080+1440+0 -ni -b -nf -un -- mpv -wid WID --loop --no-audio -fs ~/Pictures/Wallpapers/Ori.mp4 & 
#xwinwrap -ov -g 1440x900+0+180 -ni -b -nf -un -- mpv -wid WID --loop --no-audio -fs --video-scale-y=1.1 --video-scale-x=1.1 ~/Pictures/Wallpapers/MikoFox.mp4 &

#echo "---------DWM LOG AT $(date)-----------" >> ~/.logs/dwm.log
exec ~/Sources/dwm/dwm
