browsers=(qutebrowser librewolf chromium torbrowser-launcher)

for item in ${browsers[@]}; do
	menu="$menu$item"
done

choose=$(printf '%s\n' "${browsers[@]}"| dmenu -l ${#browsers[@]})

$choose
