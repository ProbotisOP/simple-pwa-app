#!/bin/bash

# Array of URLs
offlineResources=(
  "https://publish-p11055-e20059.adobeaemcloud.com/etc.clientlibs/screens/clientlibs/sequencechannel-embed.min.css"
  "https://publish-p11055-e20059.adobeaemcloud.com/etc.clientlibs/screens/clientlibs/sequencechannel-embed.min.js"
  "https://publish-p11055-e20059.adobeaemcloud.com/content/screens/satnam_project/channels/offline_probot.html"
  "https://publish-p11055-e20059.adobeaemcloud.com/content/dam/sgpools/Coke-football.jpeg"
  "https://publish-p11055-e20059.adobeaemcloud.com/content/dam/videos/AdobeStock_502925560_Video_HD_Preview.mov/_jcr_content/renditions/screens-fullhd.mp4"
  "https://publish-p11055-e20059.adobeaemcloud.com/content/dam/ravverma/AdobeStock_544453095_Video_HD_Preview.mov/_jcr_content/renditions/screens-fullhd.mp4"
  "https://publish-p11055-e20059.adobeaemcloud.com/content/dam/dontdelete-insideadobe/BOSSxPhipps_003_9x16_UHD.mp4/_jcr_content/renditions/original"
  "https://publish-p11055-e20059.adobeaemcloud.com/etc.clientlibs/toggles.json"
  "https://publish-p11055-e20059.adobeaemcloud.com/etc.clientlibs/clientlibs/granite/jquery.lc-7842899024219bcbdb5e72c946870b79-lc.min.js"
  "https://publish-p11055-e20059.adobeaemcloud.com/etc.clientlibs/clientlibs/granite/utils.lc-e7bf340a353e643d198b25d0c8ccce47-lc.min.js"
  "https://publish-p11055-e20059.adobeaemcloud.com/etc.clientlibs/clientlibs/granite/jquery/granite.lc-543d214c88dfa6f4a3233b630c82d875-lc.min.js"
  "https://publish-p11055-e20059.adobeaemcloud.com/etc.clientlibs/foundation/clientlibs/jquery.lc-dd9b395c741ce2784096e26619e14910-lc.min.js"
  "https://publish-p11055-e20059.adobeaemcloud.com/etc.clientlibs/foundation/clientlibs/shared.lc-41f79c8a45bb1766981ec4ca82d7e0e6-lc.min.js"
)

# Base directory for saving assets (change this to your preferred directory)
baseDir="$HOME/offline_assets"

# Create base directory if it doesn't exist
mkdir -p "$baseDir"

# Loop through each URL
for url in "${offlineResources[@]}"; do
  # Get the file path without the base URL
  filePath="${url#https://publish-p11055-e20059.adobeaemcloud.com/}"

  # Create the directory structure
  dirPath="$baseDir/$(dirname "$filePath")"
  mkdir -p "$dirPath"

  # Download the file and save with original name
  curl -sS -o "$baseDir/$filePath" "$url"

  # Print a message for each file downloaded
  echo "Downloaded: $baseDir/$filePath"
done
