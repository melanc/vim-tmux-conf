# tmux

快捷键参考

按下 Ctrl-b 后的快捷键如下：

```
基础
? 获取帮助信息

会话管理
s 列出所有会话
$ 重命名当前的会话
d 断开当前的会话

窗口管理
c 创建一个新窗口
, 重命名当前窗口
w 列出所有窗口
% 水平分割窗口
" 竖直分割窗口
n 选择下一个窗口
p 选择上一个窗口
0~9 选择0~9对应的窗口

窗格管理
% 创建一个水平窗格
" 创建一个竖直窗格
h 将光标移入左侧的窗格*
j 将光标移入下方的窗格*
l 将光标移入右侧的窗格*
k 将光标移入上方的窗格*
q 显示窗格的编号
o 在窗格间切换
} 与下一个窗格交换位置
{ 与上一个窗格交换位置
! 在新窗口中显示当前窗格
x 关闭当前窗格> 要使用带“*”的快捷键需要提前配置，配置方法可以参考上文的“在窗格间移动光标”一节。——译者注

其他
t 在当前窗格显示时间
```
希望这篇文章有助于你理解 tmux。


（1）教程：
http://cenalulu.github.io/linux/tmux/
http://cenalulu.github.io/linux/mac-powerline/


（2）Terminal安装solarized主题：
$ git clone git://github.com/seebi/dircolors-solarized.git
$ cp ~/dircolors-solarized/dircolors.256dark ~/.dircolors
$ eval 'dircolors .dircolors'

$ git clone https://github.com/oz123/solarized-mate-terminal.git
$ cd solarized-mate-terminal
$ ./solarized-mate.sh dark


（3）Powerline配置：
安装：
$ pip install powerline-status

查看powerline所处的具体路径
$ pip show powerline-status

添加配置：~/.bashrc
```
export LANG=en_US.utf8
export TERM="screen-256color"
POWERLINE_SCRIPT=/usr/share/powerline/bindings/bash/powerline.sh
if [ -f $POWERLINE_SCRIPT ]; then
	. $POWERLINE_SCRIPT
fi
```
	  
配置文件说明： https://powerline.readthedocs.io/en/master/configuration/reference.html
位置： /usr/local/lib/python2.7/dist-packages/powerline/config_files/
可以覆盖系统配置： ~/.config/powerline/
	  
	  
（4）字体安装：
下載最新的 Powerline 字型以及 fontconfig 字型設定檔：
	  
$ wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
$ wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
	  
將 PowerlineSymbols.otf 這個字型放進自己的字型目錄：
	  
$ mv PowerlineSymbols.otf ~/.fonts/
	  
更新字型快取：
	  
$ fc-cache -vf ~/.fonts/
	  
將字型設定檔放進適當的目錄：
	  
$ mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/}

