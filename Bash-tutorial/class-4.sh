# 字符串
# 输出字符串长度
name=$(ls)
name=12345678910111213
echo ${#name}

# 字符串提取子串的语法如下。
echo ${name:9:2}

echo ${name:9}

# Bash 提供字符串搜索和替换的多种方法。

# （1）字符串头部的模式匹配。

# 如果 pattern 匹配变量 variable 的开头，
# 删除最短匹配（非贪婪匹配）的部分，返回剩余部分
# ${variable#pattern}

# 如果 pattern 匹配变量 variable 的开头，
# 删除最长匹配（贪婪匹配）的部分，返回剩余部分
# ${variable##pattern}


myPath=/home/cam/book/long.file.name
echo ${myPath#/*/}
echo ${myPath##*/}

# 算术表达式
# $((....))

# 目录堆栈
cd /
# 回到上一个目录
cd - 
# 在记录里面添加多个记录
pushd
popd


# dirs命令可以显示目录堆栈的内容，一般用来查看pushd和popd操作后的结果。
# 清空目录堆栈``
dirs -c 