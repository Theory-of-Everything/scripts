#!/bin/sh

echo "fzab: The fuzzy abduco interative wrapper"
SESSION=$(ls ~/.abduco | \
	sed "s/@.*//g" | \
	fzf --height=10% --layout=reverse --border --print-query --header "Pick session or type new session name:")

function new_session() {
	NEW_NAME="$SESSION" && NEW_CMD=$(echo "" | fzf --height=10% --layout=reverse --border --print-query --header "Session Exec Cmd:")
	abduco -c $NEW_NAME $NEW_CMD
}

if [ -z "$SESSION" ]; then
	:
else
	abduco -a $SESSION || new_session 
fi
