#!/bin/bash

# Retrieve video titles and URLs
mapfile -t titles < <(yt-dlp --get-title --flat-playlist "ytsearch5:'your search query'")
mapfile -t urls < <(yt-dlp --get-url "ytsearch5:'your search query'")

# Prompt for title selection using fzf
selected_index=$(printf '%s\n' "${titles[@]}" | fzf --prompt="Select a video title: " --preview "yt-dlp --get-url '${urls[{}-1]}'")

# Retrieve the corresponding URL
selected_url=${urls[selected_index-1]}

# Download the audio using the selected URL
yt-dlp -x --audio-format mp3 "$selected_url"
