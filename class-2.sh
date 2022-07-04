# 模式扩展
# ～ 当前用户的主目录
echo ~
# ~+ 相当于 pwd
echo ~+
# ?字符代表文件路径里面的任意单个字符，不包括空字符。比如，Data???匹配所有Data后面跟着三个字符的文件名。
ls class-1.??
# *字符代表文件路径里面的任意数量的任意字符，包括零个字符。
ls *.sh

# 存在文件 a.txt 和 b.txt
ls [12].sh

# 大括号扩展
ls {1,2,3}.sh
for i in {1..4}
do
  echo $i
done

# 变量扩展
# ${SHELL}

# $(...)可以扩展成另一个命令的运行结果，该命令的所有输出都会作为返回值。
echo date
echo $(date)
echo `date`
# 可以嵌套使用
echo $(ls $(pwd))

# $((...))可以扩展成整数运算的结果，详见《Bash 的算术运算》一章。
echo $((1+2))