+++
author = "Grégoire MOLVEAU"
title = "Issue with npm and 5$ DigitalOcean VPS"
description = "Issue with npm and 5$ DigitalOcean VPS"
tags = [
    "npm",
    "ghost"
]
date = "2015-11-13"
menu = "main"
+++

I had an issue with my docker ghost blog, it kept being killed for no reason...

```language-bash
GET /robots.txt 200 16.540 ms - -
GET / 200 160.595 ms - -
Killed

npm ERR! Linux 3.16.0-4-amd64
npm ERR! argv "node" "/usr/local/bin/npm" "start"
npm ERR! node v0.10.40
npm ERR! npm  v2.14.1
npm ERR! code ELIFECYCLE
```

So I tried to debug npm and found that it has an issue with low ram, so a solution is to increase the swap size.

Here's how to fix it :


```language-bash
swapoff -a
dd if=/dev/zero of=/swapfile bs=1024 count=1024k 
chmod 0600 /swapfile
mkswap /swapfile
nano /etc/fstab
```
and add this line :
```language-bash
/swapfile swap swap defaults 0 0
```
then re-enable the swap
```language-bash
swapon -a
```

AND you're good to go :)