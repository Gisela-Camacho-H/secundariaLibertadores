const db = require('../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const {validationResult} = require("express-validator");

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
        const resultValidation = validationResult(req);
        const { titulo, descripcion } =  req.body;
        const Administradores_id = 1;
        
        if (resultValidation.errors.length > 0) {
            return res.render('administradores/crearAnuncio',{
                errors: resultValidation.mapped(),
                oldData:req.body,
            });
        }
        else{
            const archivo = req.file.filename;
            
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
        }
        
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
                console.log('\x1b[31m%s\x1b[0m', '///////////error/////////////');
                onsole.log('\x1b[33m%s\x1b[0m', '///////////');
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
                console.log('\x1b[31m%s\x1b[0m', '///////////error/////////////');
                console.log('\x1b[33m%s\x1b[0m', '///////////');
                console.log(error)
                res.send(error)
            })
    },
    actualizar:  async(req,res) => {
        let anuncioId = req.params.id;  
        let promesAnuncio = await Anuncios.findByPk(anuncioId,{include: ['anuncio_adminId']});

        const { titulo, descripcion } =  req.body;
        const Administradores_id = 1;
        
        const variablesDB = {
            titulo, 
            descripcion,
            Administradores_id,
        };
                        
        if (req.file) {
            console.log('\x1b[31m%s\x1b[0m', '///////////error/////////////');
            console.log('\x1b[33m%s\x1b[0m', '///////////');
            const archivo = req.file.filename;
            variablesDB.archivo = archivo;
            
        }        
        Anuncios.update(
            variablesDB,
            {
                where: {id: anuncioId}
            })
            .then(()=> {
                return res.redirect('/')})            
                .catch(error => {
                    console.log('\x1b[31m%s\x1b[0m', '///////////error/////////////');
                    console.log('\x1b[33m%s\x1b[0m', '///////////');
                    console.log(error)
                    res.send(error)
                })
            
    },
    borrar: function (req,res) {
        let  anuncioId= req.params.id;  
        Anuncios.findByPk(anuncioId)
            .then(Anuncio => {
                return res.render('anuncios/borrarAnuncio', {Anuncio})
            })
            .catch(error => res.send(error))
    },
    //*
    destruir: function (req,res) {
        let  anuncioId= req.params.id; 
        Anuncios.destroy({where: {id: anuncioId}, force: true}) 
            .then(()=>{
                return res.redirect('/')})
            .catch(error => res.send(error)) 
    },
    //*/
    
}

module.exports = anunciosController;

