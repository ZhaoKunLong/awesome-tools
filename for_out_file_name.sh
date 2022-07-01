#!/bin/bash
echo $1
i=1
for file in $(ls $1)
  do
  echo $i:
  h="$(pwd)/$file"
  echo $h
  ((i++))
done
echo "done - $1"
