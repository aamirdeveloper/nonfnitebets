let mysql = require('./node_modules/mysql2');

let connection = mysql.createConnection({
    host: '185.232.14.52',
    user: 'u498357097_nonfinitebets',
    password: 'zg!bIw7*W',
    database: 'u498357097_nonfinitebets',
    port: 3307
});

connection.connect(function(err) {
    if (err) {
        // console.log(err.message);
        return console.error('error: ' + err.message);
    }
  
    console.log('Connected to the MySQL server.');
  });
