+++
author = "Grégoire MOLVEAU"
title = "deploy an openvpn server with docker"
description = "deploy an openvpn server with docker"
tags = [
    "docker",
    "openvpn"
]
date = "2016-11-07"
menu = "main"
+++

extracted from : http://samwize.com/2016/09/10/setup-your-own-vpn-with-docker-openvpn-and-digital-ocean/
and : https://github.com/giggio/docker-openvpn-arm

***

## for arm-based VPS
```bash
OVPN_DATA="ovpn-data"

docker volume create --name $OVPN_DATA

docker run -v $OVPN_DATA:/etc/openvpn --rm giggio/openvpn-arm ovpn_genconfig -u udp://IP_ADRESS_OR_DOMAIN
```
The next step will ask you to enter a password.

```bash
docker run -v $OVPN_DATA:/etc/openvpn --rm -it giggio/openvpn-arm ovpn_initpki nopass

docker run -v $OVPN_DATA:/etc/openvpn -d --name openvpn -p 1194:1194/udp --cap-add=NET_ADMIN giggio/openvpn-arm

docker run -v $OVPN_DATA:/etc/openvpn --rm -it giggio/openvpn-arm easyrsa build-client-full USERNAME nopass

docker run -v $OVPN_DATA:/etc/openvpn --rm giggio/openvpn-arm ovpn_getclient USERNAME > USERNAME.ovpn
```

***

## for x86 VPS

```bash
OVPN_DATA="ovpn-data"

docker volume create --name $OVPN_DATA

docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://IP_ADRESS_OR_DOMAIN
```
The next step will ask you to enter a password.

```bash
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki  

docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn  

docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full USERNAME nopass

docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient USERNAME > USERNAME.ovpn  
```

***

and then you can simply download your file with :
```bash
python -m SimpleHTTPServer 8000
```
and access on your browser : [http://IP+ADRESS+OR+DOMAIN:8000](http://IP_ADRESS_OR_DOMAIN:8000)

On your client you can now download the file and use it, here are some clients : 

 * [mac os openvpn client](https://tunnelblick.net/)

 * [windows openvpn client](http://assets.unotelly.com/downloads/apps/windows/openvpn-client.msi)

 * [ubuntu openvpn client](https://doc.ubuntu-fr.org/client_openvpn)
