## http 资源下载（aria2：下载路径不支持中文）：
	
1. 路由器上安装optware
2.  下载attach下面两个附件，将两个ipk文件scp (或使用其他ftp客户端)+管理员账号登录复制到路由器/tmp 下；	
3.   备份/opt/lib/libssl.so.0.9.7 和libcrypto.so.0.9.7 两个文件(如果有的话) 
4.    ipkg install /tmp/aria2_1.16.3-1_mipsel.ipk<br>
      ipkg install /tmp/openssl_1.0.1c-2_mipsel.ipk       
5. 将备份的两个文件 复制回 /opt/lib 文件中(如果有的话)<br>
    	
    		ps：libssl.so.0.9.7 和libcrypto.so.0.9.7这2个文件在安装aria2之前可能是不存在的，如果是这样的话只需要先执行一次ipkg install /tmp/aria2_1.16.3-1_mipsel.ipk 完了之后就有了备份完了之后再升级openssl，之后再把备份的2个文件拷贝回去！
 6.  将附件中aria2文件夹复制在根目录/tmp/mnt/tomato(说明：代码是别人的，前端代码写的比较龊，没时间改，我只用功能)，修改配置文件aria2.conf中的input-file、save-session、log、dir配置为自己的配置
 7.  执行 killall  aria2c 命令  //停止aria2c命令
 8. 确认配置文件无误后执行挂载和防火墙设置：
			
			mount -o bind /tmp/mnt/sad1/opt /opt
			mount /mnt/sda1/aria2/web/   /var/wwwext/
			iptables -A INPUT -p udp --dport 6800 -j ACCEPT
			iptables -A INPUT -p tcp --dport 6800 -j ACCEPT
			aria2c --conf-path=/tmp/mnt/tomato/aria2/aria2.conf
			
	执行成功后输入：web管理地址http://192.168.1.1/ext/index.html；远程访问地址 http://域名:远程访问端口号/ext/index.html 