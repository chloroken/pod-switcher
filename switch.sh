#!/bin/bash

# Read PIDs into a working array
pids_file="/tmp/pids.txt"
mapfile -t pids_array < "$pids_file"

# Prevent out-of-bounds client selection
if [ "$1" -gt "${#pids_array[@]}" ]; then
   exit
fi

# Activate target ($tar) window
tar="${pids_array["$1-1"]}"
xdotool windowactivate --sync "$tar"
# --sync is important, otherwise the mouse won't be
# "ready to click" (need to move it) after each switch

# Minimize other windows in background (&)
for pid in "${pids_array[@]}"; do
   if [ "$pid" != "$tar" ]; then
      xdotool windowminimize "$pid" &
   fi
done
