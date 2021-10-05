#!/usr/bin/env zsh
SCROT=scrnclip_$(date +%m)_$(date +%d)_$(date +%y)_$(date +%s).png
TMP=$(mktemp '/tmp/maim-XXXXXX.png')
IMG=~/Pictures/scrot/$SCROT
sleep 0.5
function save_scrot() {
    CONFIRM=$(echo -e 'Save to Disk\nCopy to Clipboard\nSave and Copy' | rofi -dmenu -p Save\ Scrot\ Where\?)
    case "$CONFIRM" in 
        "Save to Disk")
			mv "$TMP" "$IMG" && \
				notify-send 'Scrot Saved to Disk!' "($IMG)" -a maim -u normal -i "$IMG" && echo "$IMG" | xclip -sel clip || \
				notify-send 'Failed to save to Disk' -a maim -u critical -t 5000;;
        "Copy to Clipboard")
			xclip -selection clipboard -t image/png -i < "$TMP" && \
				notify-send 'Scrot Saved to Clipboard!' "($TMP)" -a maim -u normal -i "$TMP" || \
				notify-send 'Failed to save to Clipboard' -a maim -u critical -t 5000;;
        "Save and Copy")
            xclip -selection clipboard -t image/png -i < "$TMP" && \
				mv "$TMP" "$IMG" && \
				notify-send 'Image saved and copied!' "($IMG)" -u normal -a maim -i "$IMG"|| \
                notify-send 'Image faled to save and copy!' "$TMP" -u critical -a maim -t 5000;;
        *)
            notify-send 'Inavalid Option... saving to temp file' "$TMP" -u critical -a maim -t 5000;;
    esac
}
maim -s -u -b 2 -c 0.1,1,0.1,1 "$TMP" && save_scrot || \
notify-send 'Scrot Cancelled' "($TMP)" -u critical -a maim -t 5000 
