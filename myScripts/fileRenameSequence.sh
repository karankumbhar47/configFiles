#!/bin/bash

#Example
# .myScripts/fileRenameSequence.sh "https://www.youtube.com/watch?v=InigFUSiPl8&list=PLu0W_9lII9aiL0kysYlfSOUgY5rNlOhUd" "/home/karank/Videos/courses/Download"

playlistUrl=$1
coursePath=$2

touch ~/Templates/flatPlaylist.json

yt-dlp --dump-json --flat-playlist $playlistUrl | awk '{print $0","}' | sed '$ s/.$/]/' | sed '1s/^/[/' > ~/Templates/flatPlaylist.json

jq '.[]|.filename,.playlist_index' ~/Templates/flatPlaylist.json  | awk '
{
  if(NR%2==0)
    {
      if(NR<10)
        {
          print "{\"00"$0"\":"key"},";
        }
      else if(NR<100)
        {
          print "{\"0"$0"\":"key"},";
        }
      else
        {
          print "{\""$0"\":"key"},";
        }
    } 
  else
    {
    key=$0
    }
}
'| sed 's/NA/webm/g' |sed '$ s/.$/]/' | sed '1s/^/[/' > ~/Templates/indexTitle.json

sleep 4

python  ~/.myScripts/python/fileSort.py "/home/karank/Templates/indexTitle.json" "$coursePath"


#when script is completed bulkrename files as 
#001_...
#002_...
#003_...
#.
#.
#.
#.
#113_...
#
#if you rename like this then it will show sequenctially in vlc


#indexTitle.json will be like
#[{"1":"Installing Android Studio & Setup ｜ Android Tutorials in Hindi #1 [InigFUSiPl8].webm"},
#{"2":"Creating Our First Android App (with APK) ｜ Android Tutorials in Hindi #2 [PoBePPh5Iko].webm"}]

#flatPlaylist.json will be like
#[{"_type": "url", "ie_key": "Youtube", "id": "InigFUSiPl8", "url": "https://www.youtube.com/watch?v=InigFUSiPl8", "title": "Installing Android Studio & Setup | Android Tutorials in Hindi #1", "description": null, "duration": 1743, "channel_id": "UCeVMnSShP_Iviwkknt83cww", "channel": "CodeWithHarry", "channel_url": "https://www.youtube.com/channel/UCeVMnSShP_Iviwkknt83cww", "thumbnails": [{"url": "https://i.ytimg.com/vi/InigFUSiPl8/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCVlbazQMgoCDoEx5VDAXxx9TQfLw", "height": 94, "width": 168}, {"url": "https://i.ytimg.com/vi/InigFUSiPl8/hqdefault.jpg?sqp=-oaymwEbCMQBEG5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCtmiwYwQzsLdOk6NGfrkygl_b4rA", "height": 110, "width": 196}, {"url": "https://i.ytimg.com/vi/InigFUSiPl8/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDW636F6c8kxSBgfSW6gZwDU6bDXg", "height": 138, "width": 246}, {"url": "https://i.ytimg.com/vi/InigFUSiPl8/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBWJ2GrKFTB0jkfCcFlu67_HwJczQ", "height": 188, "width": 336}], "timestamp": null, "release_timestamp": null, "availability": null, "view_count": 1000000, "live_status": null, "__x_forwarded_for_ip": null, "webpage_url": "https://www.youtube.com/watch?v=InigFUSiPl8", "original_url": "https://www.youtube.com/watch?v=InigFUSiPl8", "webpage_url_basename": "watch", "webpage_url_domain": "youtube.com", "extractor": "youtube", "extractor_key": "Youtube", "playlist_count": 34, "playlist": "Android Development Tutorials in Hindi", "playlist_id": "PLu0W_9lII9aiL0kysYlfSOUgY5rNlOhUd", "playlist_title": "Android Development Tutorials in Hindi", "playlist_uploader": "CodeWithHarry", "playlist_uploader_id": "UCeVMnSShP_Iviwkknt83cww", "n_entries": 34, "playlist_index": 1, "__last_playlist_index": 34, "playlist_autonumber": 1, "duration_string": "29:03", "epoch": 1687424025, "filename": "Installing Android Studio & Setup \uff5c Android Tutorials in Hindi #1 [InigFUSiPl8].NA", "urls": "https://www.youtube.com/watch?v=InigFUSiPl8", "_version": {"version": "2023.03.04", "current_git_head": null, "release_git_head": "392389b7df7b818f794b231f14dc396d4875fbad", "repository": "yt-dlp/yt-dlp"}},
#{"_type": "url", "ie_key": "Youtube", "id": "PoBePPh5Iko", "url": "https://www.youtube.com/watch?v=PoBePPh5Iko", "title": "Creating Our First Android App (with APK) | Android Tutorials in Hindi #2", "description": null, "duration": 1950, "channel_id": "UCeVMnSShP_Iviwkknt83cww", "channel": "CodeWithHarry", "channel_url": "https://www.youtube.com/channel/UCeVMnSShP_Iviwkknt83cww", "thumbnails": [{"url": "https://i.ytimg.com/vi/PoBePPh5Iko/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCC4PVa3c1ziRfGYdLWJ4XQMEbyng", "height": 94, "width": 168}, {"url": "https://i.ytimg.com/vi/PoBePPh5Iko/hqdefault.jpg?sqp=-oaymwEbCMQBEG5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDCt4wBFT6JWt_VWD_HwZzNaggdWw", "height": 110, "width": 196}, {"url": "https://i.ytimg.com/vi/PoBePPh5Iko/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDiKTo4mzqJdaK0tbD-5fIVJtLAFQ", "height": 138, "width": 246}, {"url": "https://i.ytimg.com/vi/PoBePPh5Iko/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLANQXbkWd8Zwi8oEb3b-nwmBmlgkA", "height": 188, "width": 336}], "timestamp": null, "release_timestamp": null, "availability": null, "view_count": 1700000, "live_status": null, "__x_forwarded_for_ip": null, "webpage_url": "https://www.youtube.com/watch?v=PoBePPh5Iko", "original_url": "https://www.youtube.com/watch?v=PoBePPh5Iko", "webpage_url_basename": "watch", "webpage_url_domain": "youtube.com", "extractor": "youtube", "extractor_key": "Youtube", "playlist_count": 34, "playlist": "Android Development Tutorials in Hindi", "playlist_id": "PLu0W_9lII9aiL0kysYlfSOUgY5rNlOhUd", "playlist_title": "Android Development Tutorials in Hindi", "playlist_uploader": "CodeWithHarry", "playlist_uploader_id": "UCeVMnSShP_Iviwkknt83cww", "n_entries": 34, "playlist_index": 2, "__last_playlist_index": 34, "playlist_autonumber": 2, "duration_string": "32:30", "epoch": 1687424025, "filename": "Creating Our First Android App (with APK) \uff5c Android Tutorials in Hindi #2 [PoBePPh5Iko].NA", "urls": "https://www.youtube.com/watch?v=PoBePPh5Iko", "_version": {"version": "2023.03.04", "current_git_head": null, "release_git_head": "392389b7df7b818f794b231f14dc396d4875fbad", "repository": "yt-dlp/yt-dlp"}}]


