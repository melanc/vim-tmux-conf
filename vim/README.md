# vimrc
配置文件： ~/.vimrc 

## 常用插件

### 插件采用Vundle管理

- ctags
	> 函数跳转

- NerdTree
	> 文件浏览器

- Tagbar
	> 函数列表

- YouCompleteMe
	> 代码自动补全，需要自己编译

- delimitMate
	> 括号自动补全
	
- c.vim
	> C语言开发

- Vim-Go
	> golang开发

- Airline
	> 状态栏、Buffer栏美化

- 安装包管理工具

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

- 安装Ctags

wget http://prdownloads.sourceforge.net/ctags/ctags-5.6.tar.gz

tar zxvf ctags-5.6.tar.gz

cd ctags-5.6

./configure && make && make install

- Ubuntu下解决gvim底部白边问题
	> vim ~/.gtkrc-2.0
```
style "vimfix" {
    # this matches my gvim theme 'Normal' bg color.
    bg[NORMAL] = "#002b36"                                                                                                                                                                    
}
widget "vim-main-window.*GtkForm" style "vimfix"
```

- 我的vim
![Vim配图](https://github.com/melanc/vimrc/blob/master/gvim.png)

