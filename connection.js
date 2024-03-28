let mysql = require('./node_modules/mysql2');

let connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'NdXp120n4XpdjI9n',
    database: 'nonfinitebets'
});

connection.connect(function(err) {
    if (err) {
        // console.log(err.message);
        return console.error('error: ' + err.message);
    }
  
    console.log('Connected to the MySQL server.');
  });
