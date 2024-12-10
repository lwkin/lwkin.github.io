##!/bin/sh
#本脚本请在git bash中运行
# 在终端输入 ./push.sh 即可打开脚本

echo -e "\033[32m正在为你备份博客中.........\033[0m"
git add .
echo -e "\033[32m正在为你备份博客中.........\033[0m"
git commit -m "backup"
echo -e "\033[32m正在为你备份博客中.........\033[0m"
git push origin hexo
echo -e "\033[32m正在为你备份博客中.........\033[0m"
hexo g -d
if [ $? -ne 0 ]; then
    echo -e "\033[31m 备份失败！请检查网络情况！ \033[0m"
else
    echo -e "\033[32m 备份成功,已为你备份至GitHub仓库! \033[0m"
fi
