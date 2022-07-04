#!/usr/bin/env bash

# read 存储用户输入
echo 输入
read text
echo 这是你的输入 $text

read firsName lastName
echo $firsName $lastName


# 读取文件
filename='/etc/hosts'
while read myline
do
  echo "$myline"
done < $filename



# if 结构
# if commands; then
#   commands
# [elif commands; then
#   commands...]
# [else
#   commands]
# fi

if test $USER = "foo"
then
  echo "Hello foo."
else
  echo "You are not foo."
fi

echo -n "输入一个1到3之间的数字（包含两端）> "
read character
if [ "$character" = "1" ]; then
    echo 1
elif [ "$character" = "2" ]; then
    echo 2
elif [ "$character" = "3" ]; then
    echo 3
else
    echo 输入不符合要求
fi

# if 的 条件语句 
# test expression
# [ expression ]
# [[ expression ]]
echo $? 

[-f /etx/hosts ]; echo $?  # 看文件是否存在


# 下面把test命令的三种形式，用在if结构中，判断一个文件是否存在。

# 写法一
if test -e /tmp/foo.txt ; then
  echo "Found foo.txt"
fi

# 写法二
if [ -e /tmp/foo.txt ] ; then
  echo "Found foo.txt"
fi

# 写法三
if [[ -e /tmp/foo.txt ]] ; then
  echo "Found foo.txt"
fi