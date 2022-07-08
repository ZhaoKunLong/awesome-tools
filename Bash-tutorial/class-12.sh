#!usr/bin/env bash

echo "编写 Shell 脚本的时候，一定要考虑到命令失败的情况，否则很容易出错。"

dir_name=/path/not/exist

# cd $dir_name
# rm *

# 上面脚本中，如果目录$dir_name不存在，cd $dir_name命令就会执行失败。这时，就不会改变当前目录，脚本会继续执行下去，导致rm *命令删光当前目录的文件。


# [[ -d $dir_name ]] && cd $dir_name &&  rm *

# echo rm *不会删除文件，只会打印出来要删除的文件。

[[ -d $dir_name ]] && cd $dir_name && echo rm *


# bash的-x参数可以在执行每一行命令之前，打印该命令。一旦出错，这样就比较容易追查。

# 环境变量

echo "This is line $LINENO"


# 变量FUNCNAME返回一个数组，内容是当前的函数调用堆栈。该数组的0号成员是当前调用的函数，1号成员是调用当前函数的函数，以此类推。

function func1()
{
  echo "func1: FUNCNAME0 is ${FUNCNAME[0]}"
  echo "func1: FUNCNAME1 is ${FUNCNAME[1]}"
  echo "func1: FUNCNAME2 is ${FUNCNAME[2]}"
  func2
}

function func2()
{
  echo "func2: FUNCNAME0 is ${FUNCNAME[0]}"
  echo "func2: FUNCNAME1 is ${FUNCNAME[1]}"
  echo "func2: FUNCNAME2 is ${FUNCNAME[2]}"
}

func1


echo "变量BASH_SOURCE返回一个数组，内容是当前的脚本调用堆栈。该数组的0号成员是当前执行的脚本，1号成员是调用当前脚本的脚本，以此类推，跟变量FUNCNAME是一一对应关系。"


# Bash 脚本有时需要创建临时文件或临时目录。常见的做法是，在/tmp目录里面创建文件或目录，这样做有很多弊端，使用mktemp命令是最安全的做法。


# trap 'rm -f "$TMPFILE"' EXIT

# TMPFILE=$(mktemp) || exit 1
# ls /etc > $TMPFILE
# if grep -qi "kernel" $TMPFILE; then
#   echo 'find'
# fi