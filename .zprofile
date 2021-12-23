export QT_STYLE_OVERRIDE=kvantum
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	sleep 1	
	exec startx
fi
