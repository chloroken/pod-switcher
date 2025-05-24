#!/bin/bash

# Read PIDs into a working array
pids_file="/tmp/pids.txt"
mapfile -t pids_array < "$pids_file"

# Prevent out-of-bounds client selection
if [ "$1" -gt "${#pids_array[@]}" ]; then
   exit
fi

# Activate target window
tar="${pids_array["$1-1"]}"
xdotool windowactivate --sync "$tar"
# --sync is important, otherwise mouse cannot
# click after each switch until it's moved

# Minimize other windows
for pid in "${pids_array[@]}"; do
   if [ "$pid" != "$tar" ]; then
      xdotool windowminimize "$pid" &
   fi
done
# Running minimize commands in background (&)
# prevents "bogging down" with rapid use
