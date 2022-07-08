#!usr/bin/env bash

# 函数（function）是可以重复使用的代码片段，有利于代码的复用。它与别名（alias）的区别是，别名只适合封装简单的单个命令，函数则可以封装复杂的多行命令。


# 函数总是在当前 Shell 执行，这是跟脚本的一个重大区别，Bash 会新建一个子 Shell 执行脚本。如果函数与脚本同名，函数会优先执行。但是，函数的优先级不如别名，即如果函数与别名同名，那么别名优先执行

# 第一种
# fn() {
#   # codes
# }

# # 第二种
# function fn() {
#   # codes
# }

function hello(){
    echo "--->hello $1"
}

hello world

today() {
  echo -n "Today's date is: "
  date +"%A, %B %-d, %Y"
}


# 查看当前有多少函数
declare -F

declare -f today

#  函数参数 变量

# $1~$9：函数的第一个到第9个的参数。
# $0：函数所在的脚本名。
# $#：函数的参数总数。
# $@：函数的全部参数，参数之间使用空格分隔。
# $*：函数的全部参数，参数之间使用变量$IFS值的第一个字符分隔，默认为空格，但是可以自定义。
# 如果函数的参数多于9个，那么第10个参数可以用${10}的形式引用，以此类推。


function alice() {
  echo "alice: $@"
  echo "$0: $1 $2 $3 $4"
  echo "$# arguments"

}

alice in wonderland

# return  返回函数值 $? 返回值 上一步的

function func_return_value {
  return 10
}
func_return_value
echo "Value returned by function is: $?"

# 全局变量和局部变量，local 命令 
# Bash 函数体内直接声明的变量，属于全局变量，整个脚本都可以读取。这一点需要特别小心。 跟C 一样

# 函数里面可以用local命令声明局部变量。

foo=20
fn () {
  local foo
  foo=1
  echo "fn: foo = $foo"
}

fn
echo "global: foo = $foo"