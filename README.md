# Gitg

zsh插件

通过命令行快速克隆代码到本地，并进入代码目录。

代码默认克隆到`~/src`下，可通过环境变量`GITG_BASE_DIR`设置。

## 安装
使用 [Antigen](https://github.com/zsh-users/antigen)
在你的`.zshrc`中添加插件
```
antigen bundle skyeryg/zsh-gitg
```

## 用法

```bash
gitg skyeryg/zsh-gitg # 默认为github仓库
gitg github://skyeryg/zsh-gitg
gitg gitee://skyeryg/zsh-gitg
gitg https://github.com/skyeryg/zsh-gitg.git
gitg git@github.com:skyeryg/zsh-gitg.git
```
