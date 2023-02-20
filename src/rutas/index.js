const { Router }= require('express');
const { render } = require('express/lib/response');
const router = Router();
const AppControler = require('../controladores/AppController');
//req: lo que recibe esta ruta
//res: lo que enviamos
router.get('/',AppControler.index);

module.exports = router;

