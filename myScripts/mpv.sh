#!/bin/bash

# Get the active window ID
active_window=$(xdotool getactivewindow)

# Switch to qutebrowser and copy the URL
#qutebrowser :buffer ; sleep 0.1s
xdotool key --clearmodifiers 'Escape' ; sleep 0.1s
xdotool key --clearmodifiers 'y' 'y' ; sleep 0.1s

# Switch back to the original window
xdotool windowactivate "$active_window"

# Get the copied URL from the clipboard
url=$(xclip -selection clipboard -o)

echo "$url"
# Open the URL in mpv
qutebrowser :spawn  mpv "$url"
