for file in "$@"; do
	track=(`basename "$file" | cut -f1 -d. | tr ' ' _ | sed 's/_-_/ /' | sed 's/.mp3//' `)
	id3v2 -a "${track[0]//_/ }" -t "${track[1]//_/ }" "$file"
	mp3unicode -s utf8 -2 unicode "$file"
	if [[ $? -ne 0 ]]; then
		echo Something wrong with $file
	fi
done
