#!/bin/sh

#check root

is_user_root () { [ "$(id -u)" -eq 0 ]; }

if is_user_root; then
    echo "\nYou are root. Continue?"
    sleep 5
else
    echo "\nYou are just an ordinary user." >&2
fi

# Who i am
echo "\nWho i am:"
id

# Who online?
echo "\nAnybody here?"
w

# System
##  Kernel version
echo "\nKernel version:"
uname -a
## Check distro
echo "\nCheck distro:"
cat /etc/issue
cat /etc/*-release

## Crontab
echo "\nCheck crontab:"
crontab -l

# Network
echo "Hostname is:" ; hostname
echo "\nIp:"
ip -br a show

# #https://gtfobins.github.io/
#Get sticky bit
echo "\nGet Sticky:"
find / -perm -1000 -type d 2>/dev/null   
echo "\nView SUID:"
find / -perm -u=s -type f 2>/dev/null
echo "\nGet GUID:"
find / -perm -g=s -type f 2>/dev/null 

# Search ssh keys
echo "\nSSH keys"
find / -name authorized_keys 2> /dev/null
find / -name id_rsa 2> /dev/null

# Looking for passwords, make a shitfull wall of text, may me add later
# grep --color=auto -rnw '/' -ie "PASSWORD" --color=always 2> /dev/null