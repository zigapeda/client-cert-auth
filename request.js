const https = require('https');
const fs = require('fs');

https.request({
  hostname: 'boatcarrier.lan',
  port: 3000,
  cert: fs.readFileSync('certs/client.crt'),
  key: fs.readFileSync('certs/client.key'),
  ca: fs.readFileSync('certs/ca.crt'),
}).end();
