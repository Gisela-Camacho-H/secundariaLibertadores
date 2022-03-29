const db = require('../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const { render } = require('express/lib/response');

const Anuncios = db.Anuncio;
const Administradores = db.Administrador;
const anunciosController = {
 
    crear: (req, res) => {
        Anuncios.findAll()
            .then(function(anuncios) {
                return res.render("administradores/crearAnuncio",{anuncios:anuncios});
            })
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
    },
    detalle: (req, res) => {
        let anuncioId = parseInt(req.params.id);
        
        Anuncios.findByPk(anuncioId, {
             //include: [
             //  { association: "anuncio_adminId"},
             //]
        })
            .then(anuncio => {
                return res.render('anuncios/detalleAnuncio', {anuncio});
            })
            .catch(err => {
                console.log('%c///////////error/////////////', 'color: red');
                console.log(err)
            });
    },
    editar:  (req,res) => {
        let anuncioId = req.params.id;
        let admin = Administradores.findAll()
        let anuncio = Anuncios.findByPk(anuncioId,{include: ['anuncio_adminId']});
        
        console.log(admin)
        Promise.all([anuncio, admin])
            .then(([Anuncio, Admin]) => {
                return res.render('anuncios/editarAnuncio', {Anuncio,Admin})})
            .catch(error => {
                console.log('%c///////////error/////////////', 'color: red');
                console.log(error)
                res.send(error)
            })
    },
    /*
    update: function (req,res) {
        let movieId = req.params.id;
        Movies
        .update(
            {
                title: req.body.title,
                rating: req.body.rating,
                awards: req.body.awards,
                release_date: req.body.release_date,
                length: req.body.length,
                genre_id: req.body.genre_id
            },
            {
                where: {id: movieId}
            })
        .then(()=> {
            return res.redirect('/movies')})            
        .catch(error => res.send(error))
    },
    delete: function (req,res) {
        let movieId = req.params.id;
        Movies
        .findByPk(movieId)
        .then(Movie => {
            return res.render(path.resolve(__dirname, '..', 'views',  'moviesDelete'), {Movie})})
        .catch(error => res.send(error))
    },
    destroy: function (req,res) {
        let movieId = req.params.id;
        Movies
        .destroy({where: {id: movieId}, force: true}) // force: true es para asegurar que se ejecute la acción
        .then(()=>{
            return res.redirect('/movies')})
        .catch(error => res.send(error)) 
    }*/
}

module.exports = anunciosController;

