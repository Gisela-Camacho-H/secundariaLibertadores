const db = require('../../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const moment = require('moment');

const Maestros = db.Maestro;

const maestrosApiController = {
 
    listado: (req, res) => {
        Maestros.findAll()
            .then(maestros => {
                
                let respuesta = {
                    meta: {
                        status : 200,
                        total: maestros.length,
                        url: 'api/maestros'
                    },
                    data: maestros
                }   
                console.log("Se muestra API de Maestros");
                res.json(respuesta);
                })  
    }
}

module.exports = maestrosApiController;

