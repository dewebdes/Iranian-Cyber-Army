<h1>Linux Packages Names</h1>
<pre>
dpkg --list
</pre>
<hr>
<h2>Remove a Package</h2>
<pre>
apt-get --purge remove [pack-name]
</pre>
<pre>
dpkg --remove [pack-name]
</pre>
<pre>
dpkg -r [pack-name].deb
</pre>
<hr>
<h2>Removing Broken Packages</h2>
In order to remove broken packages, or packages which weren’t fully installed we will run
<pre>
apt-get clean && apt-get autoremove
<br>
sudo apt-get -f install
<br>
dpkg --configure -a
</pre>
<p>
clean: Removes cache of programs older than the installed.
<br>
autoremove: Removes unnecessary files, like dependencies which are not longer needed.
<br>
-f / -fix-broken install: Fix broken dependencies, correct possible package corruption problems. We’ll see this option deeply later.
</p>
<hr>
<pre>
apt-get update
<br>
dpkg --configure -a
<br>
apt-get -f install
<br>
apt-get clean
</pre>
<pre>
apt-get update: Updates the packages’ list in the repositories.
<br>
dpkg -configure -a: This command checks for dependency problems to fix.
<br>
apt-get -f install: Another command to fix dependency problems.
<br>
apt-get autoclean: clean unnecessary dependencies.
</pre>
<hr>
<p>
Check if packages are being held by the packages manager
To check if the installer holds packages pending of installation run:
</p>
<pre>
apt-get -u dist-upgrade
</pre>
This will show you held packages. 
<b>
If listed, to remove packages run:
</b>
<pre>
apt-get remove -dry-run packagename
</pre>
