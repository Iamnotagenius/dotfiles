for file in "$@"; do
    artist=${file%% - *}
    song=${file#* - }
    song=${song%.*}
    echo Artist = $artist\nSong = $song
    id3tag -a"$artist" -s"$song" "$file"
    mp3unicode -s utf8 -2 unicode "$file"
    if [[ $? -ne 0 ]]; then
        echo Something wrong with "$file"
    fi
    ls -d -R ~/EARGASM/* | fzf --filepath-word --prompt="Where to put this song? > " --header-first --header="$artist - $song" | xargs -d \\n mv "$file"
done
