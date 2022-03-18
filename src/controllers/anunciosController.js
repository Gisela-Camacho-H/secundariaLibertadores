const db = require('../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");

const Anuncios = db.Anuncio;

const anunciosController = {
 
    crear: (req, res) => {
        Anuncios.findAll()
            .then(function(anuncios) {
                return res.render("administradores/crearAnuncio",{anuncios:anuncios});
            })
    },
    index: (req, res) => {
        res.render('index')
    }, 
    crearPost: (req, res) => {
   
        const { titulo, descripcion } =  req.body;
        const archivo = req.file.filename;
        const Administradores_id = 1;
        
        Anuncios.create({
            titulo, 
            descripcion,
            archivo,
            Administradores_id
        })
            .then(()=> {
                console.log(descripcion);
                return res.redirect('/');
            })
            .catch((error) => {
                console.log(error);
                res.render("error", {error: "Error al crear anuncio"});
            })
    },
    listado: (req, res) => {
        Anuncios.findAll().
            then((anuncios)=> {
                res.render('administradores/listadoAnuncios', {anuncios})
            })     
    }
}

module.exports = anunciosController;

