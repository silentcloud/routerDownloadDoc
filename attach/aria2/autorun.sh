#!/bin/sh
mount -o bind /tmp/mnt/sda1/opt /opt
sleep 1
mount /mnt/sda1/aria2/web/   /var/wwwext/

sleep 1
iptables -A INPUT -p udp --dport 6800 -j ACCEPT
iptables -A INPUT -p tcp --dport 6800 -j ACCEPT

sleep 1
rm /tmp/hosts
wget -P /tmp http://smarthosts.googlecode.com/svn/trunk/hosts
sleep 2
service dnsmasq restart

sleep 1
python2.6 /opt/etc/goagent/proxy.py

sleep 2
/opt/etc/init.d/S92minidlna start
sleep 3
/opt/etc/init.d/S99ushare start

sleep 3
transmission-daemon -a *.*.*.* -g /tmp/mnt/sda1/.btclient -c /tmp/mnt/sda1/torrent

sleep 3
aria2c --conf-path=/tmp/mnt/sda1/aria2/aria2.conf
