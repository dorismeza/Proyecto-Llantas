const express = require('express');
const morgan = require('morgan');
const path = require('path');
const {engine} = require('express-handlebars');

const app = express();
app.set('port',process.env.port || 3001);
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Configurando motor de plantillas 
//set es para modificar
app.engine('.hbs', engine({extname: '.hbs'}));
app.set('view engine', '.hbs');
app.set('views', './src/views');

//directorio de archivos
app.use(express.static(path.join(__dirname, 'public')));
app.use('/app',require('./rutas/index.js'));

//Definiendo el servidor
app.listen(app.get('port'),() => {
   console.log('Servidor Ejecutandose');
});