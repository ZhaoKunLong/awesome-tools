#!/bin/bash
echo $1
i=1
for file in $(ls $1)
  do
  echo $i:
  h="$1/$file"
  echo $h
  ffmpeg -i $h -filter:v "crop=900:1600:45:0" "$1/$i-$file"
  rm $h
  ((i++))
done
echo "done - $1"
