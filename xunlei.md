##利用aria2进行迅雷离线下载：

1. chrome安装插件：“迅雷离线助手”
2. 迅雷会员访问http://lixian.xunlei.com 进入自己的迅雷离线云空间，选择目标文件然后点“取回本地”旁边的三角形下拉按钮，在弹出菜单中选“Aria2导出”，然后在按键上面点新窗口打开链接；窗口中内容类似：

		http://gdl.lixian.vip.xunlei.com/download?fid=nkugxq2pmYyAR5S3DH6nYYNUEPXH5G4CAAAAAOyLboDZwBjSz3tMhOqKRHsoU2/Y&mid=666&threshold=150&tid=CE02F67......&cm=1 out=xxxxxx.mkv header=Cookie: gdriveid=D2CA90601D1EF6EFEEFF3A45989F36D2 continue=true max-connection-per-server=5 split=10 parameterized-uri=true

3. 在aria2中添加任务：链接为 http开头到out前面这段，指定文件名输入out字段的值，Header输入 Cookie（包括Cookie单词）  到 continue之前的字符，这样就ok了，尽情享受迅雷离线的速度吧；

ps：貌似每个迅雷离线会员的Cookie中的gdriveid都是一样的，所以如果是同一个好友分享的离线文件，分享一次后，以后只需要他把URL和文件名分享过来就可以了。