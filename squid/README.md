<h1><a href="https://www.linkedin.com/feed/update/urn:li:activity:6630629028594356224">SQUID HI WORD</a></h1>
<p><h2>Find & Uncomment || Add These Lines</h2> to "/etc/squid/squid.conf"</p>
<hr/>
<pre>
http_port 3128
<br>
http_access allow localnet
</pre>

<h2>Also, Add trusted IPs to squid.conf</h2>
acl localnet src [source-ip-range]

<hr>
<h3>Test SQUID</h3>
curl -x http://[YOUR-PROXY-IP]:3128 -I http://google.com
<hr>
<h2>PASS:USER</h2>
<h3>Add Users & Passwords to squid.conf</h3>
<pre>
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
<br>
auth_param basic children 5
<br>
auth_param basic realm Squid Basic Authentication
<br>
auth_param basic credentialsttl 2 hours
<br>
acl auth_users proxy_auth REQUIRED
<br>
http_access allow auth_users
<br>
</pre>
<p>
sudo systemctl restart squid
</p>
<hr>
<h3>Test SQUID</h3>

curl -x http://134.209.77.172:3128  --proxy-user proxyuser:pa33w0rd  https://www.google.com
<hr>
<h1>Re-Install SQUID</h1>
<pre>
apt-get --purge remove squid
<br>
apt-get --purge remove squid-common
<br>
apt-get --purge remove squid-langpack
<br>
sudo apt update -y
<br>
sudo apt -y install squid
<br>
sudo systemctl start squid
<br>
sudo systemctl enable squid
<br>
sudo systemctl status squid 
</pre>
