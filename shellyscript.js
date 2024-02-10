let params = {
  method: 'POST',
  url: 'https://boatcarrier.lan:3000/test',
  body: '{"einsatzdaten": "test"}',
  headers: {
    webApiToken: '123',
    accessToken: '456',
    selectiveCallCode: '789',
    hmac: 'abc',
  },
  ssl_ca: 'user_ca.pem',
};

function callback(result, error_code, error_message) {
  print('Result:', JSON.stringify(result));
  print('Error code:', error_code);
  print('Error message:', error_message);
}

Shelly.call('HTTP.Request', params, callback)
