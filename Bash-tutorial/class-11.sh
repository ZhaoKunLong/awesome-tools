#!/bin/bash


# set命令用来修改子 Shell 环境的运行参数，即定制环境。一共有十几个参数可以定制，官方手册有完整清单，本章介绍其中最常用的几个。

# 顺便提一下，如果命令行下不带任何参数，直接运行set，会显示所有的环境变量和 Shell 函数。
# set

# 执行脚本时，如果遇到不存在的变量，Bash 默认忽略它。
echo $a
echo bar

echo "set -u就用来改变这种行为。脚本在头部加上它，遇到不存在的变量就会报错，并停止执行。"

set -u
# echo $a
echo bar

echo "set -x用来在运行结果之前，先输出执行的那一行命令。"

set -x
foo
echo bar


echo "上面这些写法多少有些麻烦，容易疏忽。set -e从根本上解决了这个问题，它使得脚本只要发生错误，就终止执行。"

set -e

foo
echo bar

