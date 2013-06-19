##goagent高速翻墙

	介绍：安装之后，路由器自带翻墙，无需客户端在装goagent环境等；
		
1. 挂载硬盘到opt目录：
mount -o bind /tmp/mnt/tomato/opt /opt
2. 安装optware
3. 更新一下optware和安装busybox：
	
		ipkg update<br>
		ipkg install busybox
4. 根据GoAgent图文设置教程，网上一大片教程，自己动手搜搜吧
5. 拷贝GoAgent客户端到路由器 ，打开GoAgent目录下的local文件夹，把CA.crt、CA.key、proxy.py、proxy.ini以及certs整个文件夹上传到/opt/etc/goagent/目录下
6. 打开proxy.ini，修改[listen]里ip = 0.0.0.0，[gae]里的appid改成自己的appid(多appid请用|隔开)
7. 安装python26和OpenSSL：
		
		ipkg install python26
		ipkg install openssl
		ipkg install py26-openssl 
8. 运行goagent测试一下：
		
		python2.6 /opt/etc/goagent/proxy.py
9. 修改代理： 192.168.1.1  端口  8087