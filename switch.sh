#!/bin/bash

# Read PIDs into a working array
pids_file="/tmp/pids.txt"
mapfile -t pids_array < "$pids_file"

# Prevent out-of-bounds client selection
if [ "$1" -gt "${#pids_array[@]}" ]; then
	exit
fi

# Minimize other windows in background (&)
tar="${pids_array["$1-1"]}"
for pid in "${pids_array[@]}"; do
	if [ "$pid" != "$tar" ]; then
		xdotool windowminimize "$pid"
	fi
done &

# Use mousewheel to guarantee focus
# This is our one "action" per keypress
xdotool windowactivate --sync "$tar"
xdotool click 5 --window "$tar"
