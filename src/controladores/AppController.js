// creamos objeto vacio
const AppController = {};

AppController.index = (req,res) =>{
    res.render('home');
}

AppController.wellcome = (req,res) =>{
    res.render('wellcome');
}

AppController.login = (req,res) =>{
    res.render('login');
}
module.exports = AppController;