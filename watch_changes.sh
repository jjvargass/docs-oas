#!/bin/bash
# Requiere tener instalado:
# sudo apt-get install inotify-tools
# sudo pip install pykwiki plantuml
cd docroot
web_running=$(ps -fa|grep SimpleHTTPServer|grep -v grep)
if [ -z "$web_running" ]; then
     python -m SimpleHTTPServer 5000 &
fi
cd ..
pykwiki cache -f && cp src/* docroot/ -r
while true #run indefinitely
do 
  inotifywait -r -e modify,move,create,delete ./src *.yaml ./themes 
  pykwiki cache -f 
  cp src/* docroot/ -r
done
