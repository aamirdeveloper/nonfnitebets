let mysql = require('./node_modules/mysql2');

let connection = mysql.createConnection({
    host: '162.241.85.156',
    user: 'olysprle_nonfinite',
    password: '6JLSca$hv?,!',
    database: 'olysprle_nonfinitebets'
});

connection.connect(function(err) {
    if (err) {
        // console.log(err.message);
        return console.error('error: ' + err.message);
    }
  
    console.log('Connected to the MySQL server.');
  });
