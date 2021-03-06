DIR=~/.local/share/Steam/steamapps
EXCLUDE='Proton|Steam'
declare -A Games
for manifest in $DIR/appmanifest*; do 
	data=($(cat $manifest | grep -E "[^dlc]appid|name" | grep -v $EXCLUDE | cut -d "	" -f4 | tr ' ' '_' | tr -d '"'))
	if [[ ! ${data[1]} =~ $EXCLUDE ]]; then
		Games[${data[1]}]=${data[0]}
	fi
done
selected=`for game in ${!Games[@]}; do echo ${game//_/ }; done | dmenu -l 15 -F | tr ' ' _`
if [[ -n $selected ]]; then
	echo 'view7' >> /tmp/dwm.fifo
	steam -applaunch ${Games[$selected]} &
	exit 0
else
	exit 1
fi
