const db = require("../database/models");
const sequelize = db.sequelize;
const { Op } = require("sequelize");



const mainController = {
    index: (req, res) => {
        const reqAnuncios = db.Anuncio.findAll({
            limit:3});

        Promise.all([reqAnuncios])
            .then(([anuncios])=>{
                res.render('index',{anuncios: anuncios});
            })
        
    },
    nosotros: (req,res) =>{
        res.render('nosotros')
    },
    admision: (req,res) =>{
        res.render('admision')
    }, 
    plan: (req,res) =>{
        res.render('plan')
    }, 
    calendario: (req,res) =>{
        res.render('calendario')
    }, 
    galeria: (req,res) =>{
        res.render('galeria')
    }, 
    contacto: (req,res) =>{
        res.render('contacto')
    }, 
    otros: (req,res) =>{
        res.render('otros')
    }, 
    productos: (req,res) =>{
        res.render('productos')
    },
    register: (req, res) => {
        res.render('register')
    },
    login: (req, res) => {
        res.render('login')
    },
};


module.exports = mainController;
