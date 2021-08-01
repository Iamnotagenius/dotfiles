xrandr --output HDMI-A-0 --primary
xrandr --output DisplayPort-1 --pos 0x180
xbindkeys
numlockx &
unclutter -idle 3 &
exec xrdb ~/.Xresources &
slstatus &
picom &
xwallpaper --output HDMI-A-0 --center ~/Pictures/Wallpapers/hotline-miami-motel-retro-style-ynqg645habf75chi.jpg 
xwallpaper --output DisplayPort-1 --center ~/Pictures/Wallpapers/minecraft-rice-field-morning-view-0sihckxh4zje0m4w.jpg
rm /tmp/dwm.fifo
touch /tmp/dwm.fifo
echo "---------DWM LOG AT $(date)-----------" >> dwm.log
exec dwm >> dwm.log
