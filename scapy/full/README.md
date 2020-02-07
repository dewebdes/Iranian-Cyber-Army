<h1>INSTALL FULL FEATURED SCAPY LIBS</h1>
<pre>
[Download SCAPY from https://github.com/secdev/scapy]
[Extract & cd]
./run_scapy
apt install python-pip
pip install -U pip
pip install -U matplotlib
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
[extract & cd]
./install-tl
i
[Its take long time, let it go...]
apt install python-wand libmagickwand-dev
apt install libcdt5
apt --fix-broken install
apt install libcgraph6
apt install libgvc6
apt install libgvpr2
wget http://de.archive.ubuntu.com/ubuntu/pool/main/g/graphviz/graphviz_2.38.0-12ubuntu2_amd64.deb
dpkg -i graphviz_2.38.0-12ubuntu2_amd64.deb
pip install pyx==0.12.1
sudo apt-get install libpcap-dev
wget https://nmap.org/dist-old/nmap-4.62.tgz
[extract & cd]
./INSTALL

#============== JUST FOR PURE BSD Systems ===============
[Search & Download sox-14.4.2.tar.bz2]
[Extract & cd]
./INSTALL

#============== Other Waya ==============================
#apt install rpm
</pre>
