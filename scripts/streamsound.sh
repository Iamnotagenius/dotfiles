TMP_FILE=/tmp/streaming-modules.list

case "$1" in
	start | on)
		pactl load-module module-null-sink sink_name=Virtual1 >> $TMP_FILE
		pactl load-module module-loopback source=alsa_input.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.mono-fallback sink=Virtual1 >> $TMP_FILE
		pactl load-module module-loopback source=Virtual1.monitor sink=alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo >> $TMP_FILE
		pactl load-module module-combine-sink sink_name=nullandmain slaves=alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo,Virtual1 >> $TMP_FILE
		;;
	stop | off)
		if [[ -e $TMP_FILE ]]; then
			for mod in $(cat $TMP_FILE); do
				pactl unload-module $mod
			done
		fi
		rm $TMP_FILE
		;;
	*)
		echo "Usage: $0 {[start | on] | [stop | off]}"
		;;
esac
