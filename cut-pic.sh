#!/bin/bash
echo 请输入图片路径
read image_path
i=1
for file in $(ls $image_path); 
  do
  h="$image_path/$file"
  echo $h
  ffmpeg -i $h -filter:v "crop=900:1600:45:0" "$image_path/$i-$file"
  rm $h
  $(($i++))
done
echo "done - $image_path"
