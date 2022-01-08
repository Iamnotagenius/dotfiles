#!/bin/sh

# where music files should go
LIB_DIR=~/EARGASM
# get the filename
file=$(youtube-dl --no-warnings -f bestaudio --get-filename $1)
file=${file%.*}.mp3

# download file (if it is not present)
[[ -f $file ]] && echo "File '$file' has already been downloaded" || \
    youtube-dl -x --audio-format mp3 -f bestaudio $1
[[ $? -ne 0 ]] && echo "Error downloading file from '$1'" && exit $?

rel_file=${file##*/}
# asking user if file name is correct
read -p "Enter file name (leave empty for \"${rel_file%.*}\"): " name
[[ -z $name ]] && name=${rel_file%.*}
new_file=${name}.mp3
mv "$file" "$new_file"
file=$new_file

# tagging and moving file to library folder
artist=${name%% - *}
song=${name#* - }
id3tag -a"$artist" -s"$song" "$file"
mp3unicode -s utf8 -2 unicode "$file"
if [[ $? -ne 0 ]]; then
    echo Something wrong with "$file"
fi
(cd $LIB_DIR; ls -1dR */) | fzf --filepath-word --prompt="Where to put this song? > " \
    --header-first --header="$artist - $song" | xargs -r -Idir -d \\n mv "$file" "$LIB_DIR/dir"
