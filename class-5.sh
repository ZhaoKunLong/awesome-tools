#!/usr/bin/env bash

#  脚本执行器
echo $SHELL

# 给所有用户执行权限
# $ chmod +x script.sh

# 给所有用户读权限和执行权限
# $ chmod +rx script.sh
# 或者
# $ chmod 755 script.sh

# 只给脚本拥有者读权限和执行权限
# $ chmod u+rx script.sh


# 脚本的权限通常设为755（拥有者有所有权限，其他人有读和执行权限）或者700（只有拥有者可以执行）。

# 除了执行权限，脚本调用时，一般需要指定脚本的路径（比如path/script.sh）。如果将脚本放在环境变量$PATH指定的目录中，就不需要指定路径了。因为 Bash 会自动到这些目录中，寻找是否存在同名的可执行文件。

# 建议在主目录新建一个~/bin子目录，专门存放可执行脚本，然后把~/bin加入$PATH。

# export PATH=$PATH:~/bin
# 上面命令改变环境变量$PATH，将~/bin添加到$PATH的末尾。可以将这一行加到~/.bashrc文件里面，然后重新加载一次.bashrc，这个配置就可以生效了。

# $ source ~/.bashrc
# 以后不管在什么目录，直接输入脚本文件名，脚本就会执行。

# $ script.sh
# 上面命令没有指定脚本路径，因为script.sh在$PATH指定的目录中。

# 上面例子中，script.sh是一个脚本文件，word1、word2和word3是三个参数。

# 脚本文件内部，可以使用特殊变量，引用这些参数。

# $0：脚本文件名，即script.sh。
# $1~$9：对应脚本的第一个参数到第九个参数。
# $#：参数的总数。
# $@：全部的参数，参数之间使用空格分隔。
# $*：全部的参数，参数之间使用变量$IFS值的第一个字符分隔，默认为空格，但是可以自定义。
# 如果脚本的参数多于9个，那么第10个参数可以用${10}的形式引用，以此类推。

# 注意，如果命令是command -o foo bar，那么-o是$1，foo是$2，bar是$3。

echo $0
echo $@
echo $1+$2 = $(($1+$2))

for i in "$@"
do
  echo $i
done


#  shift 会将参数一个一个 去除，这样通过 $1 就可以遍历所有的参数了
# echo "一共输入了 $# 个参数"

# while [ "$1" != "" ]; do
#   echo "剩下 $# 个参数"
#   echo "参数：$1"
#   shift
# done

# getopts命令用在脚本内部，可以解析复杂的脚本命令行参数，通常与while循环一起使用，取出脚本所有的带有前置连词线（-）的参数。


while getopts 'lh:a:' OPTION; do
  case "$OPTION" in
    l)
      echo "这里输出 处理参数l"
      ;;

    h)
      echo "这里处理输入h 和他自带的参数"
      echo $OPTARG
      ;;

    a)
      avalue="$OPTARG"
      echo "这里处理输入的参数 a 和他自带的参数 $OPTARG"
      ;;
    ?)
      echo "这里是当输入其他设置 的时候的提示 usage: $(basename $0) [-l] [-h somevalue] [-a somevalue]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND - 1))" # 这一步是 将所有的参数 都shift 掉避免后面的程序出问题·

exit  # 终止执行

if [ $(id -u) != "0" ]; then
  echo "根用户才能执行当前脚本"
  exit 1
fi

# 命令执行结束后，会有一个返回值。0表示执行成功，非0（通常是1）表示执行失败。环境变量$?可以读取前一个命令的返回值。

cd /path/to/somewhere
if [ "$?" = "0" ]; then
  ls *
else
  echo "无法切换目录！" 1>&2
  exit 1
fi

# source命令用于执行一个脚本，通常用于重新加载一个配置文件。
source ./bashrc

# source有一个简写形式，可以使用一个点（.）来表示。

# 别名，alias 命令  ·
alias NAME=DEFINITION
alias gffp=git flow publish
alias today='date +"%A, %B %-d, %Y"'

# 解除别名·
unalias 