# vimrc
我的Vim配置文件 [欢迎交流]

## 常用插件

- ctags
	> 函数跳转

- NerdTree
	> 文件浏览器

- Tagbar
	> 函数列表

- YouCompleteMe
	> 代码自动补全

- delimitMate
	> 括号自动补全
	
- c.vim
	> C语言开发

- Vim-Go
	> golang开发

- Airline
	> 状态栏、Buffer栏美化

- Ubuntu下解决gvim底部白边问题
	> vim ~/.gtkrc-2.0
```
style "vimfix" {
    # this matches my gvim theme 'Normal' bg color.
    bg[NORMAL] = "#002b36"                                                                                                                                                                    
}
widget "vim-main-window.*GtkForm" style "vimfix"
```
