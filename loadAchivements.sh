#!/bin/bash

./loadGames.sh myGames

while read p; do
  echo $p
done < myGames.json | grep "appid" | cut -d':' -f2 | sed -e 's/ //g' | sed -e 's/,//g'
