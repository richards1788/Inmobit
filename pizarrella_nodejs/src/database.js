const mysql = require('mysql');
const { router } = require('./app');
const { database } = require('firebase-admin');

const mysqlConnection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'hevea2',
  multipleStatements: true
});

mysqlConnection.connect(function (err) {
  if (err) {
    console.error(err);
    
    return;
  } else {
    console.log('Conectado a la base de datos 2');
  }
});


module.exports = mysqlConnection;