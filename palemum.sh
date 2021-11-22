#!/bin/sh
# Check the https://github.com/swisskyrepo/PayloadsAllTheThings/


# Who i am
echo "\nWho i am:"
id

# Who online?
echo "\nAnybody here?"
w
# Kernel version
echo "\nKernel version:"
uname -a
# Check distro
echo "\nCheck distro:"
cat /etc/issue
cat /etc/*-release

# Crontab
echo "\nCheck crontab:"
crontab -l

# Network
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


# Looking for passwords, make a wall of text, may me add later
# grep --color=auto -rnw '/' -ie "PASSWORD" --color=always 2> /dev/null