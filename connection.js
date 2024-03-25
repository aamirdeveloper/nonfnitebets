let mysql = require('./node_modules/mysql2');

let connection = mysql.createConnection({
    host: '154.56.63.138',
    user: 'bets',
    password: 'o$65I3tKUl',
    database: 'nonfinite'
});

connection.connect(function(err) {
    if (err) {
        // console.log(err.message);
        return console.error('error: ' + err.message);
    }
  
    console.log('Connected to the MySQL server.');
  });
