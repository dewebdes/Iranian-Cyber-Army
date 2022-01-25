apt-get update && apt-get upgrade
service sendmail stop; update-rc.d -f sendmail remove
sudo groupadd -g 5000 vmail
sudo useradd -u 5000 -g vmail -s /usr/sbin/nologin -d /var/mail/vmail -m vmail
sudo apt-get install nginx mariadb-server php7.2-fpm php7.2-cli php7.2-imap php7.2-json php7.2-mysql php7.2-opcache php7.2-mbstring php7.2-readline
mysql_secure_installation

wget https://github.com/postfixadmin/postfixadmin/archive/refs/tags/postfixadmin-3.3.10.tar.gz
tar xzf postfixadmin-3.3.10.tar.gz
sudo mv postfixadmin-postfixadmin-3.3.10/ /var/www/postfixadmin
rm -f postfixadmin-3.3.10.tar.gz
mkdir /var/www/postfixadmin/templates_c

sudo chown -R www-data: /var/www/postfixadmin

mysql -u root -p
CREATE DATABASE postfixadmin;
GRANT ALL ON postfixadmin.* TO 'postfixadmin'@'localhost' IDENTIFIED BY 'your_secret_password';
FLUSH PRIVILEGES;
exit;

/var/www/postfixadmin/config.local.php
<?php
$CONF['configured'] = true;

$CONF['database_type'] = 'mysqli';
$CONF['database_host'] = 'localhost';
$CONF['database_user'] = 'postfixadmin';
$CONF['database_password'] = 'your_secret_password';
$CONF['database_name'] = 'postfixadmin';

$CONF['default_aliases'] = array (
  'abuse'      => 'abuse@example.com',
  'hostmaster' => 'hostmaster@example.com',
  'postmaster' => 'postmaster@example.com',
  'webmaster'  => 'webmaster@example.com'
);

$CONF['fetchmail'] = 'NO';
$CONF['show_footer_text'] = 'NO';

$CONF['quota'] = 'YES';
$CONF['domain_quota'] = 'YES';
$CONF['quota_multiplier'] = '1024000';
$CONF['used_quotas'] = 'YES';
$CONF['new_quota_table'] = 'YES';

$CONF['aliases'] = '0';
$CONF['mailboxes'] = '0';
$CONF['maxquota'] = '0';
$CONF['domain_quota_default'] = '0';
?>

sudo -u www-data php /var/www/postfixadmin/public/upgrade.php
sudo bash /var/www/postfixadmin/scripts/postfixadmin-cli admin add
kdush@mydomain.com

/etc/nginx/sites-available/mail.mydomain.com
server {

    listen 80;


    server_name mail.mydomain.com;


    return 301 https://mail.mydomain.com$request_uri;

}
server {
        #listen 80;
        #listen [::]:80;
	listen 443 ssl;

        root /var/www/postfixadmin/public/;
	error_log /var/www/postfixadmin/error.log warn;
        index index.php index.htm index.nginx-debian.html;

	ssl_certificate     /root/ssl/mydomain4-ssl-bundle.crt;
	ssl_certificate_key /root/ssl/private.key;

        server_name mail.mydomain.com mail.mydomain.com;

    location / {
       try_files $uri $uri/ /index.php;
    }

    location /postfixadmin {
       index index.php;
       try_files $uri $uri/ /postfixadmin/public/index.php;
    }

    location ~* \.php$ {
         fastcgi_split_path_info ^(.+?\.php)(/.*)$;
         if (!-f $document_root$fastcgi_script_name) {return 404;}
         fastcgi_pass  unix:/run/php/php7.4-fpm.sock;
         fastcgi_index index.php;
         include fastcgi_params;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }



}


sudo ln -s /etc/nginx/sites-available/mail.mydomain.com /etc/nginx/sites-enabled/
service nginx restart
https://mail.mydomain.com

sudo apt-get install postfix postfix-mysql dovecot-imapd dovecot-lmtpd dovecot-pop3d dovecot-mysql
Internet Site
mail.mydomain.com

sudo mkdir -p /etc/postfix/sql

/etc/postfix/sql/mysql_virtual_domains_maps.cf
user = postfixadmin
password = your_secret_password
hosts = 127.0.0.1
dbname = postfixadmin
query = SELECT domain FROM domain WHERE domain='%s' AND active = '1'

/etc/postfix/sql/mysql_virtual_alias_maps.cf
user = postfixadmin
password = your_secret_password
hosts = 127.0.0.1
dbname = postfixadmin
query = SELECT goto FROM alias WHERE address='%s' AND active = '1'

/etc/postfix/sql/mysql_virtual_alias_domain_catchall_maps.cf
user = postfixadmin
password = your_secret_password
hosts = 127.0.0.1
dbname = postfixadmin
query  = SELECT goto FROM alias,alias_domain WHERE alias_domain.alias_domain = '%d' and alias.address = CONCAT('@', alias_domain.target_domain) AND alias.active = 1 AND alias_domain.active='1'

/etc/postfix/sql/mysql_virtual_alias_domain_maps.cf
user = postfixadmin
password = your_secret_password
hosts = 127.0.0.1
dbname = postfixadmin
query = SELECT goto FROM alias,alias_domain WHERE alias_domain.alias_domain = '%d' and alias.address = CONCAT('%u', '@', alias_domain.target_domain) AND alias.active = 1 AND alias_domain.active='1'

/etc/postfix/sql/mysql_virtual_mailbox_maps.cf
user = postfixadmin
password = your_secret_password
hosts = 127.0.0.1
dbname = postfixadmin
query = SELECT maildir FROM mailbox WHERE username='%s' AND active = '1'

/etc/postfix/sql/mysql_virtual_alias_domain_mailbox_maps.cf
user = postfixadmin
password = your_secret_password
hosts = 127.0.0.1
dbname = postfixadmin
query = SELECT maildir FROM mailbox,alias_domain WHERE alias_domain.alias_domain = '%d' and mailbox.username = CONCAT('%u', '@', alias_domain.target_domain) AND mailbox.active = 1 AND alias_domain.active='1'

sudo postconf -e "virtual_mailbox_domains = mysql:/etc/postfix/sql/mysql_virtual_domains_maps.cf"
sudo postconf -e "virtual_alias_maps = mysql:/etc/postfix/sql/mysql_virtual_alias_maps.cf, mysql:/etc/postfix/sql/mysql_virtual_alias_domain_maps.cf, mysql:/etc/postfix/sql/mysql_virtual_alias_domain_catchall_maps.cf"
sudo postconf -e "virtual_mailbox_maps = mysql:/etc/postfix/sql/mysql_virtual_mailbox_maps.cf, mysql:/etc/postfix/sql/mysql_virtual_alias_domain_mailbox_maps.cf"

sudo postconf -e "virtual_transport = lmtp:unix:private/dovecot-lmtp"

sudo postconf -e 'smtp_tls_security_level = may'
sudo postconf -e 'smtpd_tls_security_level = may'
sudo postconf -e 'smtp_tls_note_starttls_offer = yes'
sudo postconf -e 'smtpd_tls_loglevel = 1'
sudo postconf -e 'smtpd_tls_received_header = yes'
sudo postconf -e 'smtpd_tls_cert_file = /root/ssl/mydomain4-ssl-bundle.crt'
sudo postconf -e 'smtpd_tls_key_file = /root/ssl/private.key'

sudo postconf -e 'smtpd_sasl_type = dovecot'
sudo postconf -e 'smtpd_sasl_path = private/auth'
sudo postconf -e 'smtpd_sasl_local_domain ='
sudo postconf -e 'smtpd_sasl_security_options = noanonymous'
sudo postconf -e 'broken_sasl_auth_clients = yes'
sudo postconf -e 'smtpd_sasl_auth_enable = yes'
sudo postconf -e 'smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks,reject_unauth_destination'

/etc/postfix/master.cf
...
submission inet n       -       y       -       -       smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_sasl_auth_enable=yes
#  -o smtpd_reject_unlisted_recipient=no
  -o smtpd_client_restrictions=permit_sasl_authenticated,reject
#  -o smtpd_helo_restrictions=$mua_helo_restrictions
#  -o smtpd_sender_restrictions=$mua_sender_restrictions
#  -o smtpd_recipient_restrictions=
#  -o smtpd_relay_restrictions=permit_sasl_authenticated,reject
  -o milter_macro_daemon_name=ORIGINATING
smtps     inet  n       -       y       -       -       smtpd
  -o syslog_name=postfix/smtps
  -o smtpd_tls_wrappermode=yes
  -o smtpd_sasl_auth_enable=yes
#  -o smtpd_reject_unlisted_recipient=no
  -o smtpd_client_restrictions=permit_sasl_authenticated,reject
#  -o smtpd_helo_restrictions=$mua_helo_restrictions
#  -o smtpd_sender_restrictions=$mua_sender_restrictions
#  -o smtpd_recipient_restrictions=
#  -o smtpd_relay_restrictions=permit_sasl_authenticated,reject
  -o milter_macro_daemon_name=ORIGINATING
...

service postfix restart

/etc/dovecot/dovecot-sql.conf.ext
...
driver = mysql
connect = host=127.0.0.1 dbname=postfixadmin user=postfixadmin password=your_secret_password
default_pass_scheme = MD5-CRYPT
iterate_query = SELECT username AS user FROM mailbox
user_query = SELECT CONCAT('/var/vmail/', maildir) AS home, 2000 AS uid, 2000 AS gid, CONCAT('*:bytes=', quota) AS quota_rule FROM mailbox WHERE username = '%u' AND active='1'
password_query = SELECT username AS user,password FROM mailbox WHERE username = '%u' AND active='1'
...

/etc/dovecot/conf.d/10-mail.conf
...
mail_location = maildir:/var/mail/vmail/%d/%n
...
mail_uid = vmail
mail_gid = vmail
...
first_valid_uid = 500
last_valid_uid = 0
...
mail_privileged_group = mail
...
mail_plugins = quota
...

/etc/dovecot/conf.d/10-auth.conf
...
disable_plaintext_auth = yes
...
auth_mechanisms = plain login
...
#!include auth-system.conf.ext
!include auth-sql.conf.ext
...

/etc/dovecot/conf.d/10-master.conf
...
service lmtp {
  unix_listener /var/spool/postfix/private/dovecot-lmtp {
    mode = 0600
    user = postfix
    group = postfix
  }
...
}
...
service auth {
  ...
  unix_listener auth-userdb {
    mode = 0600
    user = vmail
    group = vmail
  }
  ...
  unix_listener /var/spool/postfix/private/auth {
    mode = 0666
    user = postfix
    group = postfix
  }
  ...
}
...
service auth-worker {
  user = vmail
}
...
service dict {
  unix_listener dict {
    mode = 0660
    user = vmail
    group = vmail
  }
}
...

???
/etc/dovecot/conf.d/10-ssl.conf
...
ssl = yes
...
ssl_cert = </root/ssl/mydomain4-ssl-bundle.crt
ssl_key = </root/ssl/private.key
?#ssl_dh = </etc/ssl/certs/dhparam.pem
...
ssl_cipher_list = EECDH+AES:EDH+AES+aRSA
...
ssl_prefer_server_ciphers = yes
...

/etc/dovecot/conf.d/20-imap.conf
...
protocol imap {
  ...
  mail_plugins = $mail_plugins imap_quota
  ...
}
...

/etc/dovecot/conf.d/20-lmtp.conf
...
protocol lmtp {
  mail_plugins = $mail_plugins sieve quota
}
protocol imap {
  postmaster_address = postmaster@mydomain.com
  mail_plugins = $mail_plugins
}
...

/etc/dovecot/conf.d/15-mailboxes.conf
...
mailbox Drafts {
  special_use = \Drafts
}
mailbox Spam {
  special_use = \Junk
  auto = subscribe
}
mailbox Junk {
  special_use = \Junk
}
...


/etc/dovecot/conf.d/90-quota.conf
...
##
## Quota configuration.
##

# Note that you also have to enable quota plugin in mail_plugins setting.
# <doc/wiki/Quota.txt>

##
## Quota limits
##

# Quota limits are set using "quota_rule" parameters. To get per-user quota
# limits, you can set/override them by returning "quota_rule" extra field
# from userdb. It's also possible to give mailbox-specific limits, for example
# to give additional 100 MB when saving to Trash:

plugin {
  quota_rule = *:storage=1G
  quota_rule2 = Trash:storage=+100M

  # LDA/LMTP allows saving the last mail to bring user from under quota to
  # over quota, if the quota doesn't grow too high. Default is to allow as
  # long as quota will stay under 10% above the limit. Also allowed e.g. 10M.
  quota_grace = 10%%

  # Quota plugin can also limit the maximum accepted mail size.
  quota_max_mail_size = 100M
}

##
## Quota warnings
##

# You can execute a given command when user exceeds a specified quota limit.
# Each quota root has separate limits. Only the command for the first
# exceeded limit is executed, so put the highest limit first.
# The commands are executed via script service by connecting to the named
# UNIX socket (quota-warning below).
# Note that % needs to be escaped as %%, otherwise "% " expands to empty.

plugin {
  quota_warning = storage=100%% quota-warning +100 %u
  quota_warning = storage=95%% quota-warning 95 %u
  quota_warning2 = storage=80%% quota-warning 80 %u
  quota_warning4 = -storage=100%% quota-warning -100 %u # user is no longer over quota
}

# Example quota-warning service. The unix listener's permissions should be
# set in a way that mail processes can connect to it. Below example assumes
# that mail processes run as vmail user. If you use mode=0666, all system users
# can generate quota warnings to anyone.
service quota-warning {
  executable = script /usr/local/bin/quota-warning.sh
  user = dovecot
  unix_listener quota-warning {
    user = vmail
  }
}

##
## Quota backends
##

# Multiple backends are supported:
#   dirsize: Find and sum all the files found from mail directory.
#            Extremely SLOW with Maildir. It'll eat your CPU and disk I/O.
#   dict: Keep quota stored in dictionary (eg. SQL)
#   maildir: Maildir++ quota
#   fs: Read-only support for filesystem quota

plugin {
  #quota = dirsize:User quota
  #quota = maildir:User quota
  quota = dict:User quota::proxy::quota
  #quota = fs:User quota
}

# Multiple quota roots are also possible, for example this gives each user
# their own 100MB quota and one shared 1GB quota within the domain:
plugin {
  #quota = dict:user::proxy::quota
  #quota2 = dict:domain:%d:proxy::quota_domain
  #quota_rule = *:storage=102400
  #quota2_rule = *:storage=1048576
}

...

/etc/dovecot/dovecot-dict-sql.conf.ext
...
connect = host=127.0.0.1 dbname=postfixadmin user=postfixadmin password=your_secret_password
...
map {
  pattern = priv/quota/storage
  table = quota2
  username_field = username
  value_field = bytes
}
map {
  pattern = priv/quota/messages
  table = quota2
  username_field = username
  value_field = messages
}
...
# map {
#   pattern = shared/expire/$user/$mailbox
#   table = expires
#   value_field = expire_stamp
#
#   fields {
#     username = $user
#     mailbox = $mailbox
#   }
# }
...

/usr/local/bin/quota-warning.sh
#!/bin/bash
PERCENT=$1
USER=$2
cat << EOF | /usr/sbin/sendmail $USER -O "plugin/quota=maildir:User quota:noenforcing"
From: postmaster@domain.com
Subject: quota warning

Your mailbox is now $PERCENT% full.
EOF

sudo chmod +x /usr/local/bin/quota-warning.sh

if use VM: add this line to vmx file and rebbot
disk.EnableUUID = "TRUE"

/etc/dovecot/dovecot.conf
...
dict {
  quota = mysql:/etc/dovecot/dovecot-dict-sql.conf.ext
  #expire = sqlite:/etc/dovecot/dovecot-dict-sql.conf.ext
}
...

#fix: https://www.linuxbabe.com/mail-server/user-quota-postfixadmin-dovecot

sudo systemctl restart dovecot
sudo systemctl status dovecot

sudo apt install redis-server
sudo apt update
apt install resolvconf
sudo apt install unbound
sudo echo "nameserver 127.0.0.1" >> /etc/resolvconf/resolv.conf.d/head
sudo resolvconf -u
sudo apt install software-properties-common lsb-release
sudo apt install lsb-release wget
wget -O- https://rspamd.com/apt-stable/gpg.key | sudo apt-key add -
echo "deb http://rspamd.com/apt-stable/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/rspamd.list
sudo apt update
sudo apt install rspamd

/etc/rspamd/local.d/worker-normal.inc
bind_socket = "127.0.0.1:11333";

/etc/rspamd/local.d/worker-proxy.inc
...
bind_socket = "127.0.0.1:11332";
milter = yes;
timeout = 120s;
upstream "local" {
  default = yes;
  self_scan = yes;
}
...

rspamadm pw --encrypt -p your_secret_password
#copy gen pass

/etc/rspamd/local.d/worker-controller.inc
password = "{gen-password-here}";

/etc/rspamd/local.d/classifier-bayes.conf
servers = "127.0.0.1";
backend = "redis";

/etc/rspamd/local.d/milter_headers.conf
use = ["x-spamd-bar", "x-spam-level", "authentication-results"];

sudo service rspamd restart

/etc/nginx/sites-enabled/mail.mydomain.com
...
location /rspamd {
    proxy_pass http://127.0.0.1:11334/;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
...

sudo service nginx restart

sudo postconf -e "milter_protocol = 6"
sudo postconf -e "milter_mail_macros = i {mail_addr} {client_addr} {client_name} {auth_authen}"
sudo postconf -e "milter_default_action = accept"
sudo postconf -e "smtpd_milters = inet:127.0.0.1:11332"
sudo postconf -e "non_smtpd_milters = inet:127.0.0.1:11332"
sudo service postfix restart

sudo apt-get install dovecot-sieve dovecot-managesieved

/etc/dovecot/conf.d/20-lmtp.conf
...
protocol lmtp {
  postmaster_address = postmaster@mydomain.com
  mail_plugins = $mail_plugins sieve
}
...

/etc/dovecot/conf.d/20-imap.conf
...
protocol imap {
  ...
  mail_plugins = $mail_plugins imap_quota imap_sieve
  ...
}
...

/etc/dovecot/conf.d/20-managesieve.conf
...
service managesieve-login {
  inet_listener sieve {
    port = 4190
  }
}
...
service managesieve {
  process_limit = 1024
}
...

/etc/dovecot/conf.d/90-sieve.conf
plugin {
    ...
    # sieve = file:~/sieve;active=~/.dovecot.sieve
    sieve_plugins = sieve_imapsieve sieve_extprograms
    sieve_before = /var/vmail/mail/sieve/global/spam-global.sieve
    sieve = file:/var/vmail/mail/sieve/%d/%n/scripts;active=/var/vmail/mail/sieve/%d/%n/active-script.sieve

    imapsieve_mailbox1_name = Spam
    imapsieve_mailbox1_causes = COPY
    imapsieve_mailbox1_before = file:/var/vmail/mail/sieve/global/report-spam.sieve

    imapsieve_mailbox2_name = *
    imapsieve_mailbox2_from = Spam
    imapsieve_mailbox2_causes = COPY
    imapsieve_mailbox2_before = file:/var/vmail/mail/sieve/global/report-ham.sieve

    sieve_pipe_bin_dir = /usr/bin
    sieve_global_extensions = +vnd.dovecot.pipe
    ....
}

mkdir -p /var/vmail/mail/sieve/global

/var/vmail/mail/sieve/global/spam-global.sieve
require ["fileinto","mailbox"];

if anyof(
    header :contains ["X-Spam-Flag"] "YES",
    header :contains ["X-Spam"] "Yes",
    header :contains ["Subject"] "*** SPAM ***"
    )
{
    fileinto :create "Spam";
    stop;
}

/var/mail/vmail/sieve/global/report-spam.sieve
require ["vnd.dovecot.pipe", "copy", "imapsieve"];
pipe :copy "rspamc" ["learn_spam"];

/var/mail/vmail/sieve/global/report-ham.sieve
require ["vnd.dovecot.pipe", "copy", "imapsieve"];
pipe :copy "rspamc" ["learn_ham"];

sudo apt-get install build-essential
apt  install mercurial
apt install dovecot-dev
sudo apt-get install autoconf autogen
#git clone https://github.com/dovecot/pigeonhole.git
#cd pigeonhole
install libtool
#./autogen.sh
#./configure --prefix=/usr --with-dovecot=/usr/lib/dovecot --with-pigeonhole=/usr/include/dovecot/sieve --with-moduledir=/usr/lib/dovecot/modules
#make
#sudo make install

sievec /var/vmail/mail/sieve/global/spam-global.sieve
#sievec /var/vmail/mail/sieve/global/report-spam.sieve
#sievec /var/vmail/mail/sieve/global/report-ham.sieve
sudo chown -R vmail: /var/vmail/mail/sieve/

#fix1: https://linuxize.com/post/install-and-integrate-rspamd/

mkdir /var/lib/rspamd/dkim/
rspamadm dkim_keygen -b 2048 -s mail -k /var/lib/rspamd/dkim/mail.key > /var/lib/rspamd/dkim/mail.pub

/etc/rspamd/local.d/dkim_signing.conf
selector = "mail";
path = "/var/lib/rspamd/dkim/$selector.key";
allow_username_mismatch = true;

cp  /etc/rspamd/local.d/dkim_signing.conf /etc/rspamd/local.d/arc.conf

sudo service rspamd restart

cat /var/lib/rspamd/dkim/mail.pub
add output as txt recored in mail ns
like:
mail._domainkey
v=DKIM1;k=rsa;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1+7QnvdLl8eAReQcaJG4Zc9N0pUsa/Oxtsl2X7SGnno1GOxo2gTR7EpN6bnvJ8R1BC2q6GxLrKebsYd21yGXSfCaDCBBA5BPTAQCYZct5bAI3GEAsONveoHui0K2kpw+8Eo+p4yTo75FyRf/RjayvHajTYglWE3YCnzxFSnUW5B8/WqJ3k7akkZ2s6ZJZXy4kWF2pB75dluR9qNc7k2ivPJ6QQ76Q6V1WgMB7qcRnBmOcbOGrwSbaCCzJQtPvX3mkuJeYrvv8iQJYbgABQUFJKTEUI549dkojJgB/TqeyRr9hZUA+dGxEQVwAEpXrWfBk6S1uGGdf1WJB4+37tgzYwIDAQAB

sudo apt install php-intl php-mail-mime php-net-smtp php-net-socket php-pear php-xml php7.4-intl php7.4-xml php7.4-gd php7.4-gd php-imagick

mysql -u root -p
CREATE DATABASE roundcubemail;
GRANT ALL ON roundcubemail.* TO 'roundcube'@'localhost' IDENTIFIED BY 'your_secret_password';
FLUSH PRIVILEGES;
exit;

wget https://github.com/roundcube/roundcubemail/releases/download/1.3.6/roundcubemail-1.3.6-complete.tar.gz
tar xzf roundcubemail-1.3.6-complete.tar.gz
sudo mv roundcubemail-1.3.6 /var/www/webmail
rm roundcubemail-1.3.6-complete.tar.gz
chown -R www-data: /var/www/webmail

/etc/nginx/sites-enabled/webmail.mydomain.com
server {

    listen 80;


    server_name webmail.mydomain.com;


    return 301 https://webmail.mydomain.com$request_uri;

}
server {
        #listen 80;
        #listen [::]:80;
	listen 443 ssl;

        root /var/www/webmail/;
	error_log /var/www/postfixadmin/error.log warn;
        index index.php index.htm index.nginx-debian.html;

	ssl_certificate     /root/ssl/mydomain4-ssl-bundle.crt;
	ssl_certificate_key /root/ssl/private.key;

        server_name webmail.mydomain.com webmail.mydomain.com;

    location / {
       try_files $uri $uri/ /index.php;
    }

    location /postfixadmin {
       index index.php;
       try_files $uri $uri/ /postfixadmin/public/index.php;
    }

location /rspamd {
    proxy_pass http://127.0.0.1:11334/;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}

    location ~* \.php$ {
         fastcgi_split_path_info ^(.+?\.php)(/.*)$;
         if (!-f $document_root$fastcgi_script_name) {return 404;}
         fastcgi_pass  unix:/run/php/php7.4-fpm.sock;
         fastcgi_index index.php;
         include fastcgi_params;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }



}


sudo ln -s /etc/nginx/sites-available/webmail.mydomain.com /etc/nginx/sites-enabled/
service nginx restart
sudo rm -rf /var/www/roundcubemail/installer
rename config.inc.php.sample > /var/www/webmail/config.inc.php
add this line:
$config['enable_installer'] = true;

systemctl stop mysqld
systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
systemctl start mysqld

https://webmail.mydomain.com/installer
postfix: /var/log/mail.log
cd var/log > ls -lt | head
/var/log/dovecot.log
doveadm log find
doveadm log errors
#Mail access for users with UID 2000 not permitted (see first_valid_uid in config file, uid from userdb lookup):
then change first_valid_uid = currect val like <2000 and >500
like: first_valid_uid = 500 
set owner and group /var/mail/vmail to mail[500] with permit 777

outlook:
see pictures for help

