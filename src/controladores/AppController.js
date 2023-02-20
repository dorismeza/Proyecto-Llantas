// creamos objeto vacio
const AppController = {};


AppController.index = (req,res) =>{
    res.render('home');
}

module.exports = AppController;