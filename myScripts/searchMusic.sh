#!/bin/bash

# Prompt for search keyword
read -p "Enter search keyword: " keyword

# Search for videos and get the titles and URLs
videos=$(yt-dlp --get-title --get-url --flat-playlist "ytsearch5:${keyword}")

echo "" > /tmp/searchVideos.txt
# Store URLs in a JSON file
echo "[" > /tmp/searchVideos.json
IFS=$'\n' read -rd '' -a videos_array <<< "$videos"
for ((i=0; i<${#videos_array[@]}; i+=2)); do
    title="${videos_array[$i]}"
    echo "$title\n" >> /tmp/searchVideos.txt
    url="${videos_array[$i+1]}"
    echo "{\"url\":\"$url\"}," >> /tmp/searchVideos.json
done
sed -i '$s/,$//' /tmp/searchVideos.json
echo "]" >> /tmp/searchVideos.json

# Display titles using fzf for interactive selection
selected_title=$(cat /tmp/searchVideos.txt | fzf --prompt="Select a video title: ")

# Check if a valid title is selected
if [[ -n "$selected_title" ]]; then
    # Get the corresponding URL based on the selected title
    index=$(grep -Fxn "$selected_title" /tmp/searchVideos.txt | cut -d ':' -f 1)
    url=$(jq -r ".[$((index - 1))].url" < /tmp/searchVideos.json)
    echo "Selected title: $selected_title"
    echo "Selected URL: $url"

    # Play the video in mpv
    mpv "$url"
else
    echo "No title selected. Exiting."
fi

##!/bin/bash
#
## Prompt for search keyword
#read -p "Enter search keyword: " keyword
#
## Search for videos and get the titles and URLs
#videos=$(yt-dlp --get-title --get-url --flat-playlist "ytsearch5:${keyword}")
#
#echo "" > /tmp/searchVideos.txt
## Store URLs in a JSON file
#echo "[" > /tmp/searchVideos.json
#IFS=$'\n' read -rd '' -a videos_array <<< "$videos"
#for ((i=0; i<${#videos_array[@]}; i+=2)); do
#    title="${videos_array[$i]}"
#    echo "$title\n" >> /tmp/searchVideos.txt
#    url="${videos_array[$i+1]}"
#    echo "{\"url\":\"$url\"}," >> /tmp/searchVideos.json
#done
#sed -i '$s/,$//' /tmp/searchVideos.json
#echo "]" >> /tmp/searchVideos.json
#
## Display titles as choices
##titles=$(jq -r '.[].url' < /tmp/searchVideos.json)
#IFS=$'\n' read -rd '' -a titles_array < /tmp/searchVideos.txt
#
#PS3=" Select a video title: "
#select choice in "${titles_array[@]}"; do
#    # Check if a valid choice is made
#    if [[ -n "$choice" ]]; then
#        # Get the corresponding URL based on the selected title's index
#        index=$((REPLY - 1))
#        url=$(jq -r ".[$index].url" < /tmp/searchVideos.json)
#        echo "Selected title: $choice"
#        echo "Selected URL: $url"
#
#        # Play the video in mpv
#        mpv "$url"
#
#        break
#    else
#        echo "Invalid choice. Please select a valid option."
#    fi
#done
