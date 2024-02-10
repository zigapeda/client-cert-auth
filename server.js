const https = require('https');
const fs = require('fs');

const server = https.createServer({
    key: fs.readFileSync('certs/server.key'),
    cert: fs.readFileSync('certs/server.crt'),
    requestCert: true,
    rejectUnauthorized: false,
}, (req, res) => {
    console.log('Socket certificate:', req.socket.getPeerCertificate().fingerprint);
    res.end();
});

server.listen(3000);
