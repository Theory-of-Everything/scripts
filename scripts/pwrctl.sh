#!/bin/sh
case $(echo -e "Shutdown\nReboot\nLogout\nLock" | rofi -dmenu -l 4 -location 2 -yoffset 5) in
	"Shutdown")
		systemctl poweroff;;
	"Reboot")
		systemctl reboot;;
	"Logout")
		awesome quit;;
	"Lock")
		physlock -s;;
esac
