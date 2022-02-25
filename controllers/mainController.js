const path = require('path');

const mainController = {
    index: (req, res) => {
        res.render('index')
    },
    register: (req, res) => {
        res.render('register')
    },
    login: (req, res) => {
        res.render('login')
    },
    productCar: (req,res) =>{
        res.render(path.join(__dirname, '../views/productCar'))
    }
};


module.exports = mainController;