if [[ "$(tty)" = "/dev/tty1" && -z "${DISPLAY}"  &&  "${XDG_VTNR}" -eq 1 ]]; then
	sleep 1	
	exec Hyprland >> hypr.log
fi
