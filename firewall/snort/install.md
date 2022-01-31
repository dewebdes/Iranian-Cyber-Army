sudo apt update
sudo apt upgrade

sudo apt install build-essential libpcap-dev libpcre3-dev libnet1-dev zlib1g-dev luajit hwloc libdnet-dev libdumbnet-dev bison flex liblzma-dev openssl libssl-dev pkg-config libhwloc-dev cmake cpputest libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev libmnl-dev autotools-dev libluajit-5.1-dev libunwind-dev

mkdir snort-source-files
cd snort-source-files

cd ../
wget https://github.com/snort3/libdaq/archive/refs/tags/v3.0.6.tar.gz
tar xzf v3.0.6.tar.gz 
cd libdaq-3.0.6
./bootstrap
./configure
make
make install

cd ../
wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.9/gperftools-2.9.0.tar.gz
tar xzf gperftools-2.9.0.tar.gz 
cd gperftools-2.9.0/
./configure
make 
make install
cd ../
git clone git://github.com/snortadmin/snort3.git
cd snort3/
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc
cd build
make 
make install

sudo ldconfig
sudo ln -s /usr/local/bin/snort /usr/sbin/snort

ifconfing 
#to find main network interface, for example my main interface name is 'ens33'

ip link set dev ens33 promisc on
ip add sh ens33
ethtool -k ens33 | grep receive-offload
ethtool -K ens33 gro off lro off

mkdir /usr/local/etc/rules
wget https://www.snort.org/downloads/community/snort3-community-rules.tar.gz
tar xzf snort3-community-rules.tar.gz -C /usr/local/etc/rules/
wget https://raw.githubusercontent.com/dewebdes/Iranian-Cyber-Army/master/firewall/snort/2022A.rules
cp 2022A.rules /usr/local/etc/rules/

cd /usr/local/etc/snort
#edit snort.lua

HOME_NET = 'server_ip_1 server_ip_2 server_ip_3 ...'
EXTERNAL_NET = '!$HOME_NET'

...

alert_fast = { 
        file = true, 
        packet = false,
        limit = 10,
}

...

#save & exit

sudo snort -T -c /usr/local/etc/snort/snort.lua
snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/rules/2022A.rules -i ens33 -s 65535 -k none -l /var/log/snort/

#test with nmap
nmap -sP server-ip

#check snort log on server
tail /var/log/snort/alert_fast.txt
