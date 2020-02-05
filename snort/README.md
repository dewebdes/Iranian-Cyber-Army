<h1>SNORT is A PURE FIREWALL</h1>
<h2>Install it, then use these <a href="https://github.com/dewebdes/security/blob/master/emerging-all.rules.txt">65.000.000 RULES</a></h2>
<h3>After 50 year of Internet, we have over 50.000.000 Certain BUGs</h3>
<pre>
function runsnort(){
    var spawn = require('child_process').spawn;
    var command = spawn('snort', ['-A', 'console', '-q', '-u', 'snort', '-g', 'snort', '-c', '/etc/snort/snort.conf', '-i', 'ens33']);
    var result = '';
    command.stdout.on('data', function(data) {
            result += data.toString();
    });
    command.on('close', function(code) {
            return result;
    });
}
//console.log(run('ls'));



const { spawn } = require('child_process');
//snort '-A', 'console', '-q', '-u', 'snort', '-g', 'snort', '-c', '/etc/snort/snort.conf', '-i', 'ens33'
const ls = spawn('snort', ['-A', 'console', '-q', '-u', 'snort', '-g', 'snort', '-c', '/etc/snort/snort.conf', '-i', 'ens33']);
console.log('hi, wait...\n');
ls.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
	if(data.toString().toLowerCase().indexOf('nmap')>-1){
		console.log("\n\n\n NMAP FOUND \n\n\n");
		//run attack...
	}
});

ls.stderr.on('data', (data) => {
  console.error(`stderr: ${data}`);
});

ls.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});

</pre>
