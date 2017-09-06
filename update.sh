#!/bin/bash
hugo && git add . && git commit -m "update blog (update.sh)" && git push -u origin master
