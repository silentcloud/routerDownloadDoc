## 电驴资源下载（比较占资源，不太推荐用）

1. ssh到路由器
1. ipkg install amule
3. 安装完之后运行 /opt/etc/init.d/S57amuled start
4. 修改配置文件：

		进入 /opt/share/amule/.aMule 目录 修改 amule.conf 文件 Password=                                  # 这个输入填入加密 MD5 值（MD5值可以在telnet生成 在telnet 下输入 echo -n 密码 | md5sum        把密码两个字改为你要设定的密码，别中文。）
		然后把生成的MD5值复制到Password= 后面这里。继续AcceptExternalConnections=0把这里改为 AcceptExternalConnections=1 找到Enabled=0 修改为 Enabled=1 （这参数是在[WebServer]后面的别搞错） 再找到 ECPassword=  这里输入密码，方式跟之前的一样，都是MD5值。然后到 Template=    修改为 Template=default （这里是设定WEB的风格 有 default，php-default，chicane 这几种选择，可以自由选择填写）把文件保存。需要注意的是amule存放临时文件路径（TempDir）和完成文件路径（IncomingDir)，改为你自己的硬盘系统分区
		
		关闭命令为  /opt/etc/init.d/S57amuled stop
		
		然后进入 /opt/share/amule/.aMule 目录 修改 amule.conf 文件的文件存放目录
			TempDir=/tmp/mnt/tomato/amuledownload/temp
			IncomingDir=/tmp/mnt/tomato/amuledownload/incoming
		电驴的配置到此结束。
		启动命令为  /opt/etc/init.d/S57amuled start

说明 ：运行amule有两种办法。
如果想一开机启动amule，需要在初始化脚本添加启动命令。直接添加启动amule命令：/opt/etc/init.d/S57amuled start
初始化脚本：
sleep 1m   (时间可以自行设置长短）        
/opt/etc/init.d/S57amuled start

如果不想一开机就启动amule，也可通过电脑Telnet登录后启动和终止amule，telnet登录输入：
/opt/etc/init.d/S57amuled start 。
                     
5. 防火墙脚本：
		
		iptables -A INPUT -p tcp --dport 4662 -j ACCEPT 
		iptables -A INPUT -p udp --dport 4665 -j ACCEPT
		iptables -A INPUT -p udp --dport 4672 -j ACCEPT
		iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
		iptables -P OUTPUT ACCEPT

