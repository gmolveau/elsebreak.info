+++
author = "Grégoire MOLVEAU"
title = "Letsencrypt errors with new apache2 virtualhosts"
description = "Letsencrypt errors with new apache2 virtualhosts"
tags = [
    "apache2",
    "letsencrypt"
]
date = "2017-01-31"
menu = "main"
+++

I wanted to use letsencrypt on new virtualhosts with apache2 that didn't have any certificates.

I encountered all these errors ...
- `The server could not connect to the client to verify the domain :: Failed to connect to x.x.x.x:443 for TLS-SNI-01 challenge`  
- `Server only speaks HTTP, not TLS`  
- `MisconfigurationError: Error while running apache2ctl graceful.`  
- `AH00112: Warning: DocumentRoot 
[/var/lib/letsencrypt/tls_sni_01_page/] does not exist`

but these errors can be avoided 99% of the time by checking the following 

* check that you have mod_ssl enabled : 
```bash
sudo a2enmod ssl
```
*  make sure that your virtualhost files have these lines :
```ApacheConf
<IfModule mod_ssl.c>
<VirtualHost *:443>
    [...]
    SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
    Include /etc/letsencrypt/options-ssl-apache.conf
</VirtualHost>
```
* check that your firewall is accepting port 443 :
```bash
 sudo ufw allow 443
```
* apache configuration is correct :
```bash
sudo service apache2 reload
sudo apachectl -t
```