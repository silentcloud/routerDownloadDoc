##路由器脱机下载

###前言

1. 他妹的，宽带费真TM贵，交了几千块钱，白天都在上班，就偶尔晚上用一下，便宜宽带运营商了，看个高清画面还一会加载一会加载，烦死…
2. 又该租房子了，哎，伤不起，一个人的时候看高清都卡，现在房东还要收30块宽带费，而且还是N个人用，这让我看高清如何是好，看RMVB吧，被大伯鄙视；
3. …
4. 有了下面讲的这个，大家就有福了，最大化利用运营商的宽带，咱们的钱不是白交的，看高清想怎么快进就怎么快进，爽不爽？有没有心动？那就跟着我一起向下面看；

###环境准备
	必备硬件环境：带USB接口的无线路由一只（几十到几百不等）、宽带（废话）、U盘或者移动硬盘一只；
	
	购买须知：提前问问卖家路由器能不能刷TOMATO或者DD-WRT,或者支不支持；
	
	推荐路由：http://item.taobao.com/item.htm?spm=a1z09.5.0.41.VVlBlX&id=13833963026 【感谢飞哥的推荐，虽然二手但是便宜，性价比高啊】
	
###原理：

	带有TOMATO固件或者DD-WRT固件的路由就相当于一个linux系统，这下大家就明白了为啥可以脱机下载，因为它是一台小电脑嘛；下面就以totato固件作为说明；
	
###正式开始：

	以下 “存储设备”指的你的U盘 or 移动硬盘；

1. 路由接好各种设备（电源线、存储设备，大家都懂得，我废话了）；
2. 进入 USB应用 -> USB设置 -> 启用USB功能 ，稍等会就应该能看到下面 “已连接的设备”出现自己的硬盘or U盘，一般情况下，连接好开机就会自动挂载，如果没有挂载，请点击“挂载”链接，这样就可以操作硬盘了；
3. SSH到路由器（windows SecurityCRT 、mac terminal 大家都懂得，我老喜欢废话）；命令行输入
	> ssh  root@你自己路由器的IP:端口 （默认情况下，超级用户名为root，路由器地址为192.168.1.1，端口为80，除非你自己改了配置）；
	
4. 给存储设备分区：推荐使用ext3格式；
	> 说明：如果硬盘空间大点（80G以上吧，具体本人没环境试，我自己的320G不能用fdisk命令分，那就找个分区工具吧）
	
	   * U盘可以使用fdisk进行分区，分两个就好，一个作为文件系统，一个作为swap分区（一般为路由器内存的2-3倍就差不多了）；fdisk分区命令具体使用见google；ssh到路由器之后执行：

			fdisk /dev/sda （也有可能是sdb）
			输入p查看分区表是不是空的，不是空的就输入d，按照提示输入对应的分区号直到清空；
			创建分区按 n ；记得分好之后按wq命令，保存并退出分区；
       	   * 分区格式化：mkfs.ext3 -L tomato /dev/sda1   （tomato为卷标，可以随便命名），如果提示/dev/sda1 is mounted ! 就说明分区被挂载了，输入umount /dev/sda1然后再回车就卸载了；格式化swap分区：mkswap -L SWAP /dev/sda2
5. 初始化optware：

		mkdir /mnt/tomato
		mount /dev/sda1 /mnt/tomato  (一系列环境挂载 )
		mkdir /mnt/tomato/opt
		mount -o bind  /mnt/tomato/opt /opt
		wget http://bbs.dualwan.cn/downloads/optware/optware-install.sh -O - | tr -d '\r' >  optware-install.sh
		sh optware-install.sh
		/opt/bin/ipkg update
6. 设置开机自动挂载opt 
	
		进入 USB应用 -> USB设置，在挂载后运行中输入：
	
	<pre>mount -o bind /mnt/tomato/opt /opt
	 swapon /dev/sda2</pre>
		
至此，可以使用tomato 1.28版本自带的bt脱机下载了，具体见 USB应用 -> BT脱机下载 ，勾选启用bt客户端，保存设置；

* 外部 Transmission web控制器皮肤：[http://code.google.com/p/transmission-control](http://code.google.com/p/transmission-control) ，安装外部Transmission，进入U盘以下路径\sda1\opt\share\transmission\web，将下载的文件解压后复制进去,路由器的Transmission主程序位置选为“外置/opt/bin”,命令：
			
		ipkg install transmission
		/opt/bin/transmission-daemon -V

	
	
	



	
	
	
