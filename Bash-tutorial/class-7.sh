#!/usr/bin/env bash

echo 字符串判断

# [ string ]：如果string不为空（长度大于0），则判断为真。
# [ -n string ]：如果字符串string的长度大于零，则判断为真。
# [ -z string ]：如果字符串string的长度为零，则判断为真。
# [ string1 = string2 ]：如果string1和string2相同，则判断为真。
# [ string1 == string2 ] 等同于[ string1 = string2 ]。
# [ string1 != string2 ]：如果string1和string2不相同，则判断为真。
# [ string1 '>' string2 ]：如果按照字典顺序string1排列在string2之后，则判断为真。
# [ string1 '<' string2 ]：如果按照字典顺序string1排列在string2之前，则判断为真。
# 注意，test命令内部的>和<，必须用引号引起来（或者是用反斜杠转义）。否则，它们会被 shell 解释为重定向操作符。

echo Type the answer "(yes | no | maybe)"
read ANSWER

if [ -z "$ANSWER" ]; then
  echo "There is no answer." >&2
  exit 1
fi
if [ "$ANSWER" = "yes" ]; then
  echo "The answer is YES."
elif [ "$ANSWER" = "no" ]; then
  echo "The answer is NO."
elif [ "$ANSWER" = "maybe" ]; then
  echo "The answer is MAYBE."
else
  echo "The answer is UNKNOWN."
fi


echo 整数判断

# [ integer1 -eq integer2 ]：如果integer1等于integer2，则为true。
# [ integer1 -ne integer2 ]：如果integer1不等于integer2，则为true。
# [ integer1 -le integer2 ]：如果integer1小于或等于integer2，则为true。
# [ integer1 -lt integer2 ]：如果integer1小于integer2，则为true。
# [ integer1 -ge integer2 ]：如果integer1大于或等于integer2，则为true。
# [ integer1 -gt integer2 ]：如果integer1大于integer2，则为true。

echo 请输入整数
read INT

if [ -z "$INT" ]; then
  echo "INT is empty." >&2
  exit 1
fi
if [ $INT -eq 0 ]; then
  echo "INT is zero."
else
  if [ $INT -lt 0 ]; then
    echo "INT is negative."
  else
    echo "INT is positive."
  fi
  if [ $((INT % 2)) -eq 0 ]; then
    echo "INT is even."
  else
    echo "INT is odd."
  fi
fi

echo 正则判断
# [[ string1 =~ regex ]]

read INT

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  echo "INT is an integer."
else
  echo "INT is not an integer." >&2
  exit 1
fi

# 逻辑运算

# && ｜｜ !

MIN_VAL=1
MAX_VAL=100

INT=50

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  if [[ $INT -ge $MIN_VAL && $INT -le $MAX_VAL ]]; then
    echo "$INT is within $MIN_VAL to $MAX_VAL."
  else
    echo "$INT is out of range."
  fi
else
  echo "INT is not an integer." >&2
#   exit 1
fi
if [ ! \( $INT -ge $MIN_VAL -a $INT -le $MAX_VAL \) ]; then
    echo "$INT is outside $MIN_VAL to $MAX_VAL."
else
    echo "$INT is in range."
fi

# 上面例子中，test命令内部使用的圆括号，必须使用引号或者转义，否则会被 Bash 解释。

if ((3 > 2)); then
  echo "true"
fi

if ((0)); then echo "It is true."; else echo "it is false."; fi

if (( foo = 5 ));then echo "foo is $foo"; fi


INT=-5

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  if ((INT == 0)); then
    echo "INT is zero."
  else
    if ((INT < 0)); then
      echo "INT is negative."
    else
      echo "INT is positive."
    fi
    if (( ((INT % 2)) == 0)); then
      echo "INT is even."
    else
      echo "INT is odd."
    fi
  fi
else
  echo "INT is not an integer." >&2
  exit 1
fi

# 对于&&操作符，先执行command1，只有command1执行成功后， 才会执行command2。对于||操作符，先执行command1，只有command1执行失败后， 才会执行command2。
# command1 && command2
# command1 || command2
echo 测试 temp 在不在。 否则创建 
# [ -d temp ] || mkdir temp
# [ ! -d temp ] && exit 1



filename=$1
word1=$2
word2=$3

if grep $word1 $filename && grep $word2 $filename
then
  echo "$word1 and $word2 are both in $filename."
fi

# [[ -d "$dir_name" ]] && cd "$dir_name" && rm *

# if [[ ! -d "$dir_name" ]]; then
#   echo "No such directory: '$dir_name'" >&2
#   exit 1
# fi
# if ! cd "$dir_name"; then
#   echo "Cannot cd to '$dir_name'" >&2
#   exit 1
# fi
# if ! rm *; then
#   echo "File deletion failed. Check results" >&2
#   exit 1
# fi





# Case 判断

# case expression in
#   pattern )
#     commands ;;
#   pattern )
#     commands ;;
#   ...
# esac


echo -n "输入一个1到3之间的数字（包含两端）> "
read character
case $character in
  1 ) 
  echo 1
    ;;
  2 ) 
  echo 2
    ;;
  3 ) 
  echo 3
    ;;
  * ) 
  echo 输入不符合要求
esac


OS=$(uname -s)

case "$OS" in
  FreeBSD) echo "This is FreeBSD" ;;
  Darwin) echo "This is Mac OSX" ;;
  AIX) echo "This is AIX" ;;
  Minix) echo "This is Minix" ;;
  Linux) echo "This is Linux" ;;
  *) echo "Failed to identify this OS" ;;
esac



# case的匹配模式可以使用各种通配符，下面是一些例子。

# a)：匹配a。
# a|b)：匹配a或b。
# [[:alpha:]])：匹配单个字母。
# ???)：匹配3个字符的单词。
# *.txt)：匹配.txt结尾。
# *)：匹配任意输入，通过作为case结构的最后一个模式。

echo -n "输入一个字母或数字 > "
read character
case $character in
  [[:lower:]] | [[:upper:]] ) echo "输入了字母 $character"
                              ;;
  [0-9] )                     echo "输入了数字 $character"
                              ;;
  * )                         echo "输入不符合要求"
esac



bash -version
#  匹配多个 ·::&·  bash 4.0 才支持
read -n 1 -p "Type a character > "
echo
case $REPLY in
  [[:upper:]])    echo "'$REPLY' is upper case." ;;&
  [[:lower:]])    echo "'$REPLY' is lower case." ;;&
  [[:alpha:]])    echo "'$REPLY' is alphabetic." ;;&
  [[:digit:]])    echo "'$REPLY' is a digit." ;;&
  [[:graph:]])    echo "'$REPLY' is a visible character." ;;&
  [[:punct:]])    echo "'$REPLY' is a punctuation symbol." ;;&
  [[:space:]])    echo "'$REPLY' is a whitespace character." ;;&
  [[:xdigit:]])   echo "'$REPLY' is a hexadecimal digit." ;;&
esac
