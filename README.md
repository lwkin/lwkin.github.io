# 【hexo部署】<br>
## 1、环境准备：安装Node.js和Git，配置Git与GitHub，并设置SSH密钥，保证连接成功；<br>
## 2、初始化Hexo项目：<br>
（1）创建一个保存博客源码的文件夹，如Hexo-Blog，在文件夹内右键鼠标，选择Open Git Bash here；<br>
（2）在Git BASH输入如下命令安装Hexo：<br>
npm install -g hexo-cli && hexo -v <br>
安装完后输入hexo -v 验证是否安装成功；<br>
（3）初始化 Hexo 项目安装相关依赖：<br>
     hexo init myblog <br>
     cd myblog <br>
     npm i <br>
（4）完成后，文件夹下应有如下文件：<br>
其中文件夹：<br>
※ .github：github相关文件<br>
※ node_modules：依赖包模块目录<br>
※ scaffolds：存放博客模板文件夹：草稿模板、页面模板、文章模板<br>
※ source：存放博客基本目录文件夹<br>
※ themes：主题文件夹<br>
其中文件：<br>
※ .gitignore: github相关文件(过滤上传文件列表)<br>
※ _config.landscape.yml：主题的配置文件<br>
※ config.yml：博客的配置文件<br>
※ package.json：项目名称、描述、版本、运行和开发等信<br>
※ package-lock.json：依赖包描述文件<br>
※ .npmignore：发布时忽略的文件（可忽略）<br>
（5）输入如下指令 hexo cl && hexo s 启动项目并通过 http://localhost:4000/ 访问；<br>
## 3、将静态博客挂载到 GitHub Pages<br>
（1）安装 hexo-deployer-git：<br>
npm install hexo-deployer-git --save <br>
（2）修改 _config.yml 文件：打开博客文件夹下的_config.yml文件，将最后部分修改如下（注意，github项目地址后面.git要保留）：<br>
deploy:<br>
  type: git<br>
  repository: git@github.com:github项目地址.git<br>
  branch: main<br>
（3）修改好配置后，运行如下命令，将代码部署到 GitHub（Hexo三连）：<br>
hexo clean && hexo generate && hexo deploy (简写：hexo cl; hexo g; hexo d) <br>
挂载完毕，博客文件夹中多出如下文件：<br>
其中文件夹：<br>
※ public：为编译完成的html文件<br>
※.deploy_git：github相关文
## 4、美化主题 <br>
（1）博客根目录执行如下命令安装主题：<br>
git clone -b main https://github.com/anzhiyu-c/hexo-theme-anzhiyu.git themes/anzhiyu；<br>
安装完成后，themes主题文件夹下出现了anzhiyu主题文件包文件。
（2）第一次使用需要安装 pug 以及 stylus 的渲染器：<br>
npm install hexo-renderer-pug hexo-renderer-stylus --save <br>
（3）应用主题：修改 hexo 配置文件_config.yml，把主题改为anzhiyu，将anzhiyu主题文件下的_config.yml配置文件复制重命名_config.anzhiyu.yml并放置到博客根目录下；<br>
（4）将themes文件夹下anzhiyu主题包内的.git删除掉，否则后面会影响hexo分支备份；<br>
（5）本地预览：hexo cl; hexo s，推送上线：hexo cl; hexo g; hexo d <br>
# 【多终端同步配置】 <br><br>
## 1、创建分支（在github上操作）：首先在Github上面创建一个分支命名为hexo，将hexo设置为主要分支。<br>
## 2、初始化分支：<br>
在已经部署好Hexo环境的电脑的安装Hexo的根目录下拉取hexo分支，步骤如下：<br>
（1）git clone 仓库地址，将仓库文件拉取到本地，生成的文件名为 username.github.io；<br>
（2）进入username.github.io文件夹，除了.git文件夹以外，其他文件全部删除；<br>
（4）命令 git add . 将修改提交至暂存区；<br>
（5）命令 git commit -m “提交说明”，提交本次修改；<br>
（6）命令 git push origin hexo 将本次修改推送到远端hexo；<br>
（7）将刚才未删除的.git文件夹拷贝至博客根目录，删除username.github.io文件夹，此时本地的Hexo目录已与github上面的hexo文件夹关联了，而且默认的.gitignore已经配置了忽略规则，所以已经可以将根目录下的文件同步上去，还是依次调用add、commit、push三个命令将当前的文件推送至远程的hexo分支。<br>
# 【新增终端使用方法】：<br><br>
## 1、环境准备：安装Node.js和Git，配置Git与GitHub，并设置SSH密钥，保证连接成功；<br>
## 2、创建文件夹Blog，在Blog文件夹下面还行以下操作：<br>
（1）克隆备份：git clone <ssh连接地址>；<br>
（2）在clone下来的仓库文件夹中安装和配置hexo环境，依次调用命令：<br>
npm install hexo <br>
npm install <br>
npm install hexo-deployer-git<br>
（不需要hexo init）<br>
（3）此时通过命令 hexo cl && hexo s，即可在本地开启同步下来的博客静态页面，并通过 http://localhost:4000/ 访问。<br>
# 【后期维护】<br><br>
后续不管是哪个终端，如果修改了主题或者新增了博文，按照以下步骤即可：<br>
1、git pull origin hexo    #从仓库拉取代码并自动合并本地
2、git add .    # 暂存修改文件；<br>
3、git commit -m “修改说明”    # 提交修改；<br>
4、git push origin hexo    # 将新增博文原文件推送至hexo分支；<br>
5、hexo g -d  # 将博文静态页面发布至maser分支。<br>
目录下拉取远程备份和更新备份都已封装以上指令，分别为pull.sh和push.sh，每次操作前，请先执行pull.sh文件，执行命令为：./pull.sh，以确保本地代码是最新且与服务端一致，每次更新本地文件后执行push.sh，执行命令为：./push.sh，进行备份和发布。
# 【其他】<br><br>
1、如遇wordcount不存在的问题，是因为新机未安装wordcount字符计数模块，用此命令安装：npm install hexo-wordcount --save <br>
2、如果在hexo d时出现很多warning: LF will be replaced by CRLF的警告的话，那是由于windows中的换行符为CRLF，而linux中换行符为LF导致的，运行此语句：git config --global core.autocrlf false  //禁用自动转换 <br>
3、开启本搜索：用此命令安装：npm install hexo-generator-search --save ，安装模块依赖后，在_config.anzhiyu.yml主题文件中开启搜索模块。<br>
4、文章置顶：用此命令安装：npm install hexo-generator-topindex --save，然后给需要置顶的文章加入top参数数字，数值越大，越靠前。<br>
4、如果主题文件夹中无安知鱼主题，请重新安装，安装方法是在博客根目录下，执行git clone -b main https://github.com/anzhiyu-c/hexo-theme-anzhiyu.git themes/anzhiyu；<br>
