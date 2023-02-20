//create pool
const mysql = require('mysql');
const {database} = require('./keys');

//para
const {promisify} = require('util');

const pool = mysql.createPool(database);

//Identificamos los tipos de errores comunes 
pool.getConnection((err, connection) => {
    if(err) {
        if(err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('Conexion perdida');
        }
        if(err.code === 'ER_CON_COUNT_ERROR') {
            console.error('Multiples conexiones en la base de datos');
        }
        if(err.code === 'ECONNREFUSED') {
            console.error('Conexion rechazada');
        }
    }
    //si hay conexion
    if (connection) {
        connection.release();
        console.log('Conectado a la base de datos')
    }
});

//convertir nuestras query a promesas
pool.query = promisify(pool.query);

//exportar para usar
module.exports = pool;