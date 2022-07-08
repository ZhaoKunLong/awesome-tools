#!/bin/bash

echo 数组

array[0]="a"
array[1]="b"

array=(a b c)

# 声明一个数组
# declare -a ARRAYNAME


# 通过 读入 来生成一个数组
# read -a dice

echo $array[0]

echo ${array}
echo ${array[1]}

echo ${array[@]}

for i in "${array[@]}"; do
    echo $i
done

#  字符之间有空格 的形式。 需要加双引号
activities=( swimming "water skiing" canoeing "white-water rafting" surfing )

for act in ${activities[@]};
do
    echo "Activity: $act";
done

echo "字符之间有空格 的形式。 需要加双引号" 

for act in "${activities[@]}";
do
    echo "Activity: $act";
done

echo "\${activities[*]}不放在双引号之中，跟\${activities[@]}不放在双引号之中是一样的。"

for act in ${activities[*]};
do
    echo "Activity: $act";
done

echo "\${activities[*]}放在双引号之中，所有成员就会变成单个字符串返回。"

for act in "${activities[*]}";
do
    echo "Activity: $act";
done

echo "拷贝一个数组的最方便方法，就是写成下面这样。"

hobbies=( "${activities[@]}" )
hobbies=( "${activities[@]}" diving )

echo "${hobbies[@]}"

echo 数组的长度·

echo ${#hobbies[*]}

echo 返回元素${hobbies[0]}的长度
echo ${#hobbies[0]}


echo "\${!array[@]}或 \${!array[*]}，可以返回数组的成员序号，即哪些位置是有值的。"

arr=([5]=a [9]=b [23]=c)
echo ${!arr[@]}


echo "\${array[@]:position:length}的语法可以提取数组成员。"
food=( apples bananas cucumbers dates eggs fajitas grapes )

echo ${food[@]:1:1}

echo ${food[@]:4}

# 追加数组成员
foo=(a b c)
echo ${foo[@]}
foo+=(d e f)
echo ${foo[@]}

# 删除数组
echo "删除了数组中的第三个元素，下标为2。"
unset foo[2]
echo ${foo[@]}


# Bash 的新版本支持关联数组。关联数组使用字符串而不是整数作为数组索引。

# declare -A可以声明关联数组。

declare -A colors
colors["red"]="#ff0000"
colors["green"]="#00ff00"
colors["blue"]="#0000ff"
# 关联数组必须用带有-A选项的declare命令声明创建。相比之下，整数索引的数组，可以直接使用变量名创建数组，关联数组就不行。

# 访问关联数组成员的方式，几乎与整数索引数组相同。

echo ${colors["blue"]}