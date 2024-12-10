##!/bin/sh
#本脚本请在git bash中运行
# 在终端输入 ./pull.sh 即可打开脚本

echo -e "\033[32m正在为你从GitHub仓库拉取代码并自动合并中...\033[0m"
git pull origin hexo
if [ $? -ne 0 ]; then
    echo -e "\033[31m 拉取失败！请检查网络情况！ \033[0m"
else
    echo -e "\033[32m 拉取合并成功,你本地代码已与GitHub仓库一致! \033[0m"
fi
