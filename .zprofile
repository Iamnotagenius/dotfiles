export VISUAl="vim"
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	sleep 1	
	exec startx
fi
