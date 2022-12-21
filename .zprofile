export QT_STYLE_OVERRIDE=kvantum
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	sleep 1	
	exec sway
fi
