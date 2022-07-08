echo $SHELL
bash --version
echo $BASH_VERSION

# echo 单行输出
echo hello world

# 多行输出
echo "Ni hao ma
xie 谢谢你··"

# 反斜杠 用于命令换行
echo hello \
world

# 分号。执行多个命令
pwd; ls

#  && 前面执行成功 就执行后面的  || 前面执行失败执行后面的 ; 不管前面成功/失败都执行
pwd && pwd
pwd || pwd

ls ./w/ || ls
ls pwd || ls



