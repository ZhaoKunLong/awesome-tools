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

# [ -a file ]：如果 file 存在，则为true。
# [ -b file ]：如果 file 存在并且是一个块（设备）文件，则为true。
# [ -c file ]：如果 file 存在并且是一个字符（设备）文件，则为true。
# [ -d file ]：如果 file 存在并且是一个目录，则为true。
# [ -e file ]：如果 file 存在，则为true。
# [ -f file ]：如果 file 存在并且是一个普通文件，则为true。
# [ -g file ]：如果 file 存在并且设置了组 ID，则为true。
# [ -G file ]：如果 file 存在并且属于有效的组 ID，则为true。
# [ -h file ]：如果 file 存在并且是符号链接，则为true。
# [ -k file ]：如果 file 存在并且设置了它的“sticky bit”，则为true。
# [ -L file ]：如果 file 存在并且是一个符号链接，则为true。
# [ -N file ]：如果 file 存在并且自上次读取后已被修改，则为true。
# [ -O file ]：如果 file 存在并且属于有效的用户 ID，则为true。
# [ -p file ]：如果 file 存在并且是一个命名管道，则为true。
# [ -r file ]：如果 file 存在并且可读（当前用户有可读权限），则为true。
# [ -s file ]：如果 file 存在且其长度大于零，则为true。
# [ -S file ]：如果 file 存在且是一个网络 socket，则为true。
# [ -t fd ]：如果 fd 是一个文件描述符，并且重定向到终端，则为true。 这可以用来判断是否重定向了标准输入／输出／错误。
# [ -u file ]：如果 file 存在并且设置了 setuid 位，则为true。
# [ -w file ]：如果 file 存在并且可写（当前用户拥有可写权限），则为true。
# [ -x file ]：如果 file 存在并且可执行（有效用户有执行／搜索权限），则为true。
# [ file1 -nt file2 ]：如果 FILE1 比 FILE2 的更新时间最近，或者 FILE1 存在而 FILE2 不存在，则为true。
# [ file1 -ot file2 ]：如果 FILE1 比 FILE2 的更新时间更旧，或者 FILE2 存在而 FILE1 不存在，则为true。
# [ FILE1 -ef FILE2 ]：如果 FILE1 和 FILE2 引用相同的设备和 inode 编号，则为true。

FILE=~/.bashrc

if [ -e "$FILE" ]; then
  if [ -f "$FILE" ]; then
    echo "$FILE is a regular file."
  fi
  if [ -d "$FILE" ]; then
    echo "$FILE is a directory."
  fi
  if [ -r "$FILE" ]; then
    echo "$FILE is readable."
  fi
  if [ -w "$FILE" ]; then
    echo "$FILE is writable."
  fi
  if [ -x "$FILE" ]; then
    echo "$FILE is executable/searchable."
  fi
else
  echo "$FILE does not exist"
  exit 1
fi

