#!/bin/sh

# Check root
is_user_root () { [ "$(id -u)" -eq 0 ]; }

if is_user_root; then
    echo "\nYou are root. Continue?"
    sleep 5
else
    echo "\nYou are just an ordinary user." >&2
fi

# Who i am
GETCURRENTUSERNAME="$(whoami)"
echo "\nCurrent User:" 
echo "${GETCURRENTUSERNAME}"

GETCURRENTUSERID="$(id)"
echo "\nUser ID"
echo "${GETCURRENTUSERID}"

GETLOGGEDUSERS="$(w)"
echo "\nAnybody here?"
echo "${GETLOGGEDUSERS}"

# System
##  Kernel version
GETKERNELVERSION="$(cat /proc/version)"
echo "\nKernel version:"
echo "${GETKERNELVERSION}"

## Check distro
CHECKDISTRO="$(cat /etc/issue)"
echo "\nCheck Distro:"
echo "${CHECKDISTRO}"

CHECKRELEASE="$(cat /etc/*-release)"
echo "\nCheck Release:"
echo "#${CHECKRELEASE}"

GETHOSTNAME="$(hostname)"
echo "Hostname is:"
echo "${GETHOSTNAME}"

# Crontab
CHECKCRONTAB="$(crontab -l)"
echo "\nCheck crontab:"
echo "${CHECKCRONTAB}"

CHECKSCHEDULED="$(ls -la /etc/cron* 2>/dev/null)"
echo "\nScheduled cron jobs"
echo "${CHECKSCHEDULED}"


# Network
SHOWIP="$(ip -br a show)"
echo "\nIp:"
echo "${SHOWIP}"

SHOWROUTES="$(route)"
echo "\nShow routes:"
echo "${SHOWROUTES}"

SHOWNETSTAT="$(netstat -antup)"
echo "\nNetstat:"
echo "${SHOWNETSTAT}"

# File system
SHOWMOUNTS="$(mount)"
echo "\nShow Mounts:"
echo "${SHOWMOUNTS}"

SHOWFSTAB="$(cat /etc/fstab 2>/dev/null)"
echo "\nShow fstab:"
echo "${SHOWFSTAB}"

# Enumerating users and env info
GETPASSWD="$(cat /etc/passwd )"
echo "\nAll users:"
echo "${GETPASSWD}"

GETSUPERUSERS="$(grep -v -E '^#' /etc/passwd | awk -F: '$3 == 0{print $1}')"
echo "\nSuper Users Found:"
echo "${GETSUPERUSERS}"

GETENVIROMENT="$(env 2>/dev/null | grep -v 'LS_COLORS')"
echo "\nEnvironment:"
echo "${GETENVIROMENT}"

GETSUDOERS="$(cat /etc/sudoers 2>/dev/null | grep -v '#' 2>/dev/null)"
echo "\nSudoers (privileged):"
echo "${GETSUDOERS}"

GETACTIVESCREEN="$(screen -ls 2>/dev/null)"
echo "\nList out any screens running for the current user:" 
echo "${GETACTIVESCREEN}"

GETLOGGEDUSERSACTIVITY="$(who -a 2>/dev/null)"
echo "\nLogged in User Activity:" 
echo "${GETLOGGEDUSERSACTIVITY}"

# Search ssh keys
echo "\nSSH keys"

GETIDRSA="$(find / -name id_rsa 2> /dev/null)"
echo "\nGet id_rsa keys"
echo "${GETIDRSA}"

GETAUTHKEYS="$(find / -name authorized_keys 2> /dev/null)"
echo "\nGet authorized_keys:"
echo "${GETAUTHKEYS}"

# User input history
RHISTORY="$(ls -la /root/.*_history 2>/dev/null)" # See if you have access too Root user history (depends on privs)
echo "Show _history:"
echo "${RHISTORY}"

BASHHISTORY="$(cat ~/.bash_history 2>/dev/null)" # Get the contents of bash history file for current user
echo "Show .bash_history:"
echo "${BASHHISTORY}"

NANOHISTORY="$(cat ~/.nano_history 2>/dev/null)" # Try to get the contents of nano history file for current user
echo "Show .nano_history:"
echo "${NANOHISTORY}"

ATFTPHISTORY="$(cat ~/.atftp_history 2>/dev/null)" #  Try to get the contents of atftp history file for current user
echo "Show .atftp_history:"
echo "${ATFTPHISTORY}"

MYSQLHISTORY="$(cat ~/.mysql_history 2>/dev/null)" # Try to get the contents of mysql history file for current user 
echo "Show .mysql_history:"
echo "${MYSQLHISTORY}"

PHPHISTORY="$(cat ~/.php_history 2>/dev/null)" # Try to get the contents of php history file for current user
echo "Show .php_history:"
echo "${PHPHISTORY}"

PYTHONHISTORY="$(cat ~/.python_history 2>/dev/null)" # Try to get the contents of python history file for current user
echo "Show .python_history:"
echo "${PYTHONHISTRY}"

REDISHISTORY="$(cat ~/.rediscli_history 2>/dev/null)" # Try to get the contents of redis cli history file for current user
echo "Show .rediscli_history:"
echo "${REDISHISTORY}"

TDSQLHISTORY="$(cat ~/.tdsql_history 2>/dev/null)" # Try to get the contents of tdsql history file for current user 
echo "Show tdsql_history:"
echo "${TDSQLHISTORY}"


# ENUMERATING USER *.rc Style Files For INFO
GBASHRC="$(cat /etc/bashrc 2>/dev/null)" # Get the contents of bash rc file form global config file
echo "Get /etc/bashrc:"
echo "${GBASHRC}"

BASHRC="$(cat ~/.bashrc 2>/dev/null)" #Get the contents of bash rc file for current user 
echo "Get ./bashrc:"
echo "${BASHRC}"

SCREENRC="$(cat ~/.screenrc 2>/dev/null)" # Try to get the contents of screen rc file for current user
echo "Get ./screenrc:"
echo "${SCREENRC}"

GSCREENRC="$(cat /etc/screenrc 2>/dev/null)" # Try to get the contents of screen rc file form global config file 
echo "Get /etc/screenrc:"
echo "${GSCREENRC}"

VIRC="$(cat ~/.virc 2>/dev/null)" # Try to get the contents of vi rc file for current user 
echo "Get ./virc:"
echo "${VIRC}"

MYSQLRC="$(cat ~/.mysqlrc 2>/dev/null)" # Try to get the contents of mysql rc file for current user 
echo "Get ./mysqlrc:"
echo "${MYSQLRC}"

NETRC="$(cat ~/.netrc 2>/dev/null)" #Try to get the contents of legacy net rc file for current user
echo "Get ./netrc:"
echo "${NETRC}"


#ENUMERATING FILE AND DIRECTORY PERMISSIONS/CONTENTS...

## https://gtfobins.github.io/
## https://github.com/sleventyeleven/linuxprivchecker/

#Get sticky bit
GETSTICKYBITS="$(find / -perm -1000 -type d 2>/dev/null)"
echo "\nGet Sticky:"
echo "${GETSTICKYBITS}"

GETSUID="$(find / -perm -u=s -type f 2>/dev/null)"
echo "\nView SUID:"
echo "${GETSUID}"

GETGUID="$(find / -perm -g=s -type f 2>/dev/null)"
echo "\nGet GUID:"
echo "${GETGUID}"

GLOBALDIRSROOT="$(find / \( -wholename '/home/homedir*' -prune \) -o \( -type d -perm -0002 \) -exec ls -ld '{}' ';' 2>/dev/null | grep root)"  
echo "\nGet Global Writeable Directories for User/Group 'Root:"
echo "${WWDIRSROOT}"

GLOBALDIRS="$(find / \( -wholename '/home/homedir*' -prune \) -o \( -type d -perm -0002 \) -exec ls -ld '{}' ';' 2>/dev/null | grep -v root)" 
echo "\nGet Global Writeable Directories for Users other than Root:"
echo "${GLOBALDIRS}"

GLOBALFILES="$(find / \( -wholename '/home/homedir/*' -prune -o -wholename '/proc/*' -prune \) -o \( -type f -perm -0002 \) -exec ls -l '{}' ';' 2>/dev/null)" 
echo "\nGet Global Writable Files:"
echo "${GLOBALFILES}"

ROOTHOME="$(ls -ahlR /root 2>/dev/null)" 
echo "\nChecking if root's home folder is accessible:"
echo "${ROOTHOME}"


# Get passwords
GETLOGPWDS="$(find /var/log -name '*.log' 2>/dev/null | xargs -l10 egrep 'pwd|password' 2>/dev/null)"
echo "\nLogs containing keyword 'password:"
echo "${GETLOGPWDS}"

GETCONFPWDS="$(find /etc -name '*.c*' 2>/dev/null | xargs -l10 egrep 'pwd|password' 2>/dev/null)"
echo "\nConfig files containing keyword 'password:"
echo "${GETCONFPWDS}"

GETSHADOW="$(cat /etc/shadow 2>/dev/null)" # 
echo "\nGet /etc/shadow content:"
echo "${GETSHADOW}"

# Looking for passwords, make a shitfull wall of text, may be add later
# grep --color=auto -rnw '/' -ie "PASSWORD" --color=always 2> /dev/null


# secrets in envs
echo "\nGet secrets from env"
## aws
printenv | grep "AWS_ACCESS_KEY_ID"
printenv | grep "AWS_SECRET_ACCESS_KEY"
printenv | grep "AMAZON_AWS_ACCESS_KEY_ID"
printenv | grep "AMAZON_AWS_SECRET_ACCESS_KEY"

## azure
printenv | grep "AZURE_CLIENT_ID"
printenv | grep "AZURE_CLIENT_SECRET"
printenv | grep "AZURE_USERNAME"
printenv | grep "AZURE_PASSWORD"
printenv | grep "MSI_ENDPOINT"
printenv | grep "MSI_SECRET"

## binance
printenv | grep "binance_api"
printenv | grep "binance_secret"

## Bittrex
printenv | grep "BITTREX_API_KEY"
printenv | grep "BITTREX_API_SECRET"

## CircleCI
printenv | grep "CIRCLE_TOKEN"

## Digitalocean
printenv | grep "DIGITALOCEAN_ACCESS_TOKEN"

## Dockerhub
printenv | grep "DOCKERHUB_PASSWORD"

## Fastlane products
printenv | grep "ITC_PASSWORD" 

## Facebook
printenv | grep "FACEBOOK_APP_ID"
printenv | grep "FACEBOOK_APP_SECRET"
printenv | grep "FACEBOOK_ACCESS_TOKEN"

## github
printenv | grep "GH_TOKEN"
printenv | grep "GITHUB_TOKEN" 
printenv | grep "GH_ENTERPRISE_TOKEN"
printenv | grep "GITHUB_ENTERPRISE_TOKEN" 

## Google Cloud
printenv | grep "GOOGLE_APPLICATION_CREDENTIALS"
printenv | grep "GOOGLE_API_KEY"

## gitlab
printenv | grep "CI_DEPLOY_USER"
printenv | grep "CI_DEPLOY_PASSWORD"
printenv | grep "GITLAB_USER_LOGIN"
printenv | grep "CI_JOB_JWT"
printenv | grep "CI_JOB_JWT_V2"
printenv | grep "CI_JOB_TOKEN"

## mailgun
printenv | grep "MAILGUN_API_KEY"

# mongodb
printenv | grep "MCLI_PRIVATE_API_KEY"
printenv | grep "MCLI_PUBLIC_API_KEY"

## npm
printenv | grep "NPM_TOKEN"

## openstack 
printenv | grep "OS_PASSWORD"

## Percy.io
printenv | grep "PERCY_TOKEN"

## Sentry
printenv | grep "SENTRY_AUTH_TOKEN"

## Slack
printenv | grep "SLACK_TOKEN"

## Square
printenv | grep "square_access_token"
printenv | grep "square_oauth_secret"

## Stripe
printenv | grep "STRIPE_API_KEY"
printenv | grep "STRIPE_DEVICE_NAME"

## Twilio
printenv | grep "TWILIO_ACCOUNT_SID"
printenv | grep "TWILIO_AUTH_TOKEN" 

## Twitter
printenv | grep "CONSUMER_KEY"
printenv | grep "CONSUMER_SECRET"

## Vault HashiCorp
printenv | grep "VAULT_TOKEN"
printenv | grep "VAULT_CLIENT_KEY"

# == Done == 
echo "\nDone."
