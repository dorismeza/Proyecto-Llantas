const express = require('express');
const morgan = require('morgan');
const path = require('path');
const {engine} = require('express-handlebars');

const app = express();
app.set('port',process.env.port || 3001);
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

app.engine('handlebars',engine());
app.set('views engine','handlebars');
app.set('views','./src/views');

//app.use(require('/app/public',express.static(path.join((__dirname,'public/')))));
app.use('/app',require('./rutas/index'));
app.use(express.static(path.join(__dirname, 'public/')));

app.listen(app.get('port'),() => {
   console.log('Servidor Ejecutandose');
});