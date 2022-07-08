#!usr/bin/env bash

echo 循环


# while conditon do
#     commands
# done

number=0
while [ "$number" -lt 10 ]; do
  echo "Number = $number"
  number=$((number + 1))
done


while [ ! "$hello" = "y" ]
do
  echo 'Hi, while looping ...';
  read hello
  echo you typed $hello
done


echo Until 循环
# until condition 
# do
#     commands
# done


number=0
until [ "$number" -ge 10 ]; do
  echo "Number = $number"
  number=$((number + 1))
done


# until cp $1 $2; do
#   echo 'Attempt to copy failed. waiting...'
#   sleep 5
# done
# 和下面同一个意思
# while ! cp $1 $2; do
#   echo 'Attempt to copy failed. waiting...'
#   sleep 5
# done




echo "For in  循环"
# for variable in list
# do
#   commands
# done



for i in word1 word2 word3; do
  echo $i
done

for i in *.png; do
  ls -l $i
done

count=0
for i in $(cat ~/.bash_profile); do
  count=$((count + 1))
  echo "Word $count ($i) contains $(echo -n $i | wc -c) characters"
done


echo "for 循环"
# for (( expression1; expression2; expression3 )); do
#   commands
# done

# for (( expression1; expression2; expression3 )); do
#   commands
# done

# (( expression1 ))
# while (( expression2 )); do
#   commands
#   (( expression3 ))
# done


for (( i=0; i<5; i=i+1 )); do
  echo $i
done

for ((;;))
do
  read var
  if [ "$var" = "." ]; then
    break
  fi
done

# break continue

for number in 1 2 3 4 5 6
do
  echo "number is $number"
  if [ "$number" = "3" ]; then
    break
  fi
done


#  Select 结构  生成菜单 它的语法与 for ....  in 基本一致
# select name
# [in list]
# do
#   commands
# done



echo "Which Operating System do you like?"

select os in Ubuntu LinuxMint Windows8 Windows10 WindowsXP
do
  case $os in
    "Ubuntu"|"LinuxMint")
      echo "I also use $os."
    ;;
    "Windows8" | "Windows10" | "WindowsXP")
      echo "Why don't you try Linux?"
    ;;
    *)
      echo "Invalid entry."
      break
    ;;
  esac
done