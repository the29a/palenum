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
echo "\nAnybody here?"
w

# System
##  Kernel version
echo "\nKernel version:"
cat /proc/version
## Check distro
echo "\nCheck distro:"
cat /etc/issue
cat /etc/*-release
echo "Hostname is:" ; hostname

# Crontab
echo "\nCheck crontab:"
crontab -l
echo "\nScheduled cron jobs"
ls -la /etc/cron* 2>/dev/null
echo "\nWritable cron dirs"


# Network
echo "\nIp:"
ip -br a show
echo "\nShow routes:"
route
echo "\nNetstat:"
netstat -antup

# File system
echo "\nShow Mounts:"
mount
echo "\nShow fstab"
cat /etc/fstab 2>/dev/null


# #https://gtfobins.github.io/
#Get sticky bit
echo "\nGet Sticky:"
find / -perm -1000 -type d 2>/dev/null   
echo "\nView SUID:"
find / -perm -u=s -type f 2>/dev/null
echo "\nGet GUID:"
find / -perm -g=s -type f 2>/dev/null 

# Enumerating users and env info
echo "\nCurrent User:" 
whoami
echo "\nCurrent User ID:"
"id" 
echo "\nAll users:"
cat /etc/passwd 
echo "\nSuper Users Found:"
grep -v -E '^#' /etc/passwd | awk -F: '$3 == 0{print $1}' 
echo "\nEnvironment:"
env 2>/dev/null | grep -v 'LS_COLORS' 
echo "\nSudoers (privileged):"
cat /etc/sudoers 2>/dev/null | grep -v '#' 2>/dev/null
echo "\nList out any screens running for the current user:" 
screen -ls 2>/dev/null  
echo "\nLogged in User Activity:" 
who -a 2>/dev/null

# Search ssh keys
echo "\nSSH keys"
find / -name authorized_keys 2> /dev/null
find / -name id_rsa 2> /dev/null

echo "\nDone."
# Looking for passwords, make a shitfull wall of text, may be add later
# grep --color=auto -rnw '/' -ie "PASSWORD" --color=always 2> /dev/null