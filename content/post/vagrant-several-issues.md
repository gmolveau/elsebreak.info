+++
author = "Christophe DOUY"
title = "Vagrant : Several issues I ran into"
description = "Vagrant : Several issues I ran into"
tags = [
    "vagrant"
]
date = "2016-02-23"
menu = "main"
+++

``Lost association with VM (VirtualBox) : ``

Running ``vagrant up `` isn't bringing up a previously created VM but is creating a new one.

`` vagrant status `` reports that no vm is created yet, while VirtualBox shows it still exists.

Solution : 
A great post about this issue is the one from mobmad: 
https://github.com/mitchellh/vagrant/issues/1755

First, get the hash of your vm with the following command :
``VBoxManage list vms``

If VBoxManage is not in your path, it should be something like
``C:\Program Files\Oracle\VirtualBox\VBoxManage.exe``

Then get back to the root of your project and run the following 
``echo -n "insert-hash-to-vm-here" > .vagrant/machines/default/virtualbox/id``


and there you go, you can ``vagrant up`` again and find your good old vm.

Saved me a few hours from installing huge databases :) 


``SSH issue on vagrant up : Error: Connection timeout. Retrying... ``

Get your ssh key ( ``~/.ssh/id_rsa`` usually )
Copy it into a new ``insecure_private_key`` file placed in your vagrant install directory (something like ``C:\Users\*username*\.vagrant.d\insecure_private_key``)

Log in your vm (``vagrant ssh`` will still ask for a password at this step) , create an ``authorized-keys`` file in ``~/.ssh`` and copy your ``id_rsa.pub`` into it. Double check it's correctly copied (your key should be one line, check with ``wc -l``)

log out, try to log back in, it should ssh just fine :) 





