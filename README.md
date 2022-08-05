# what's this  repo

It's a faster asahi linux installer with local network cache.
See urlcache.py/map\_url

Based on installer with mod : https://alx.sh (2022-08-04)

Like: https://github.com/AsahiLinux/asahi-installer.git/src


# how to run
* need python3>=8.9 (version not tested, I guess)
* sudo ./install.sh


# why this repo
嫌它下载太慢啦！虽然我网络是有一点问题，但是它的下载速度也远没有达到我的网络上限
它下载的东西，我用aria2早下好了，它还在慢慢的干活

另外，官方installer在中途失败的情况下，再用就很糟了，没考虑过这种情况，
我加入了删除分区的支持，并且修正了一些问题（比如要清理临时文件）
