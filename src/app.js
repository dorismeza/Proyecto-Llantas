const express = require('express');
const morgan = require('morgan');
const path = require('path')

require('dotenv').config();
const app = express();
// me permite ver por consola lo que va llegando al servidor
app.use(morgan('dev'));
//soportar los datos que vamos a recibir
app.use(express.urlencoded({extended:false}));
app.use(express.json());
app.set('json spaces', 2);

//iniciando el servidor
app.listen(5000, ()=>{
    console.log('Servidor iniciado en el puerto 5000');
})