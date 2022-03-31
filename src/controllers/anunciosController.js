const db = require('../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const { render } = require('express/lib/response');
const console = require('console');

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
                console.log('\x1b[31m%s\x1b[0m', '///////////error/////////////')
                console.log(err)
            });
    },
    editar: async (req,res) => {
        let anuncioId = parseInt(req.params.id);
        let promesaAdmin = await Administradores.findAll()
        let promesAnuncio = await Anuncios.findByPk(anuncioId,{include: ['anuncio_adminId']});
       
        //console.log(promesaAdmin);

        await Promise.all([promesAnuncio, promesaAdmin])
            .then(([anuncio, admin]) => {
                return res.render('anuncios/editarAnuncio', {anuncio, admin})})
            .catch(error => {
                console.log('\x1b[31m%s\x1b[0m', '///////////error/////////////')
                console.log('\x1b[33m%s\x1b[0m', '///////////')
                //console.log('%c///////////error/////////////', 'color: red');
                console.log(error)
                res.send(error)
            })
    },
    
    actualizar:  async(req,res) => {
        let anuncioId = req.params.id;  
        let promesAnuncio = await Anuncios.findByPk(anuncioId,{include: ['anuncio_adminId']}, {raw:true});

        const { titulo, descripcion } =  req.body;
        const Administradores_id = 1;
        
        const variablesDB = {
            titulo, 
            descripcion,
            Administradores_id,
        };
        
                
        if (req.file) {
            console.log('\x1b[31m%s\x1b[0m', '/////error//////');
            const archivo = req.file.filename;
            variablesDB.archivo = archivo;
            //console.log(archivo)
        }
        console.log(variablesDB);
        
        Anuncios.update(
            variablesDB,
            {
                where: {id: anuncioId}
            })
        .then(()=> {
            return res.redirect('/')})            
            .catch(error => {
                console.log('\x1b[31m%s\x1b[0m', '///////////error/////////////')
                console.log('\x1b[33m%s\x1b[0m', '///////////')
                //console.log('%c///////////error/////////////', 'color: red');
                console.log(error)
                res.send(error)
            })
            
    },
    /*
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

