const db = require('../../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const moment = require('moment');

const Anuncios = db.Anuncio;

const anunciosApiController = {
 
    
    listado: (req, res) => {
        Anuncios.findAll()
            .then(anuncios => {
                
                let respuesta = {
                    meta: {
                        status : 200,
                        total: anuncios.length,
                        url: 'api/anuncios'
                    },
                    data: anuncios
                }   
                console.log(respuesta);
                res.json(respuesta);
                })  
    }
}

module.exports = anunciosApiController;

