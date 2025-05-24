# pod-switcher

A Linux, X11-based client-switcher for EVE Online. It's faster than most other workspace packages and minimizes inactive windows to improve multibox performance. It does not feature thumbnail previews.

## Installation (using Fedora as an example)
1) Install dependency: `sudo dnf install xdotool`
2) Install dependency: `sudo dnf install git`
3) Copy this repo: `git clone https://gitub.com/chloroken/pod-switcher/`
4) Add your characters to `characters.txt` with format `"EVE - Characternamehere"`
5) Set up keybinds. See section below for details
6) Log into your characters and use your keybind for `refreshpids.sh`
7) Now you can use `switch.sh` keybinds to change clients

## Keybinds
There are numerous ways to accomplish keybinding the scripts. In XFCE for example, the `xfce4-keyboard-settings` package allows binding bash scripts to keys if that command is in the `sh 'bash command here'` format. KDE and Gnome should offer similar functionality with their own packages.

However, not all desktop environments have this functionality. For those without a keybind manager, consider the following solution:
1) Install Simple X Hotkey Daemon: `sudo dnf install sxhkd`
2) Set sxhkd to run on startup (on XFCE use: `xfce4-session-settings`)
3) Create an sxhkd config file: `nano ~/.config/sxhkd/sxhkdrc`
4) Use the following text as an example config file, noting the arguments `"1"`, `"2"`:

```
  F1
      bash ~/Documents/pod-switcher/switch.sh "1"
  F2
      bash ~/Documents/pod-switcher/switch.sh "2"
  F3
      bash ~/Documents/pod-switcher/switch.sh "3"
  F4
      bash ~/Documents/pod-switcher/switch.sh "4"
  F5
      bash ~/Documents/pod-switcher/refreshpids.sh
```

## Uninstall:
  - Remove installation folder: `rm -rf /path/to/your/install/pod-switcher/`
  - Remove temporary text file: `rm /tmp/pids.txt`

## To-Do:
  - ~~Combine keybind scripts with arguments~~
  - ~~Fix leading linebreak on 'characters.txt'~~
  - ~~Remove dead frames while switching~~
  - ~~Create safeguards for when keybinds can't work~~
      - ~~e.g., `switch.sh "5"` with only 4 characters, etc.~~
  - ~~Run profiling to improve switching speeds~~
  - ~~Create a service for keybinds~~
  - Add thumbnail preview toggle support
  - Package script bundle with Makefile
