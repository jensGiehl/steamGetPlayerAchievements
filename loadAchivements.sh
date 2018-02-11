#!/bin/bash

# Load Gamelist
./loadGames.sh myGames

# Extract AppIds
cat myGames.json | grep "appid" | cut -d':' -f2 | sed -e 's/ //g' | sed -e 's/,//g' > myAppIds.txt

# Remove Gamelist
rm myGames.json

# Load Achievments for every App
while read appId; do
  logger "Load Achievments for AppId $appId"
  ./wgetRetry.sh "http://api.steampowered.com/ISteamUserStats/GetPlayerAchievements/v0001/?appid=$appId&key=$STEAM_KEY&steamid=$STEAM_ID" "$appId.json"
done < myAppIds.txt

# Remove AppIds
rm myAppIds.txt
