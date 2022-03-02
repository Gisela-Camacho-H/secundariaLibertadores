const path = require('path');

const mainController = {
    index: (req, res) => {
        res.render('index')
    },
    nosotros: (req,res) =>{
        res.render(path.join(__dirname, '../views/nosotros'))
    },
    admision: (req,res) =>{
        res.render(path.join(__dirname, '../views/admision'))
    }, 
    plan: (req,res) =>{
        res.render(path.join(__dirname, '../views/plan'))
    }, 
    calendario: (req,res) =>{
        res.render(path.join(__dirname, '../views/calendario'))
    }, 
    galeria: (req,res) =>{
        res.render(path.join(__dirname, '../views/galeria'))
    }, 
    contacto: (req,res) =>{
        res.render(path.join(__dirname, '../views/contacto'))
    }, 
    otros: (req,res) =>{
        res.render(path.join(__dirname, '../views/otros'))
    }, 
    productos: (req,res) =>{
        res.render(path.join(__dirname, '../views/productos'))
    },
    register: (req, res) => {
        res.render('register')
    },
    login: (req, res) => {
        res.render('login')
    },
};


module.exports = mainController;