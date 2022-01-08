xrandr --output HDMI-A-0 --primary
xrandr --output DisplayPort-1 --pos 0x180
xbindkeys
numlockx &
unclutter -idle 3 &
exec xrdb ~/.Xresources &
slstatus &
picom &
dunst &
xwinwrap -ov -g 1920x1080+0+0 -ni -b -nf -un -- mpv -wid WID --loop --no-audio -fs ~/Pictures/Wallpapers/Ori.mp4 & 
#xwinwrap -ov -g 1920x1080+1440+0 -ni -b -nf -un -- mpv -wid WID --loop --no-audio -fs ~/Pictures/Wallpapers/Ori.mp4 & 
#xwinwrap -ov -g 1440x900+0+180 -ni -b -nf -un -- mpv -wid WID --loop --no-audio -fs --video-scale-y=1.1 --video-scale-x=1.1 ~/Pictures/Wallpapers/MikoFox.mp4 &
rm /tmp/dwm.fifo
touch /tmp/dwm.fifo
echo "---------DWM LOG AT $(date)-----------" >> dwm.log
exec dwm >> dwm.log
