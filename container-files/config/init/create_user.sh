#!/bin/bash
user=$USER
pwd=$PASSWORD
ret=false
getent passwd $user >/dev/null 2>&1 && ret=true

if $ret; then
echo "user already exists";
else

useradd $user -d /data/$user

echo "${user}:${pwd}" | chpasswd

echo "${user}  ALL=(ALL)  NOPASSWD: ALL" > /etc/sudoers.d/$user
echo "user created"
fi
