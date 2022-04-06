const db = require('../../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const moment = require('moment');

const Estudiantes = db.Estudiante;

const estudiantesApiController = {
 
    listado: (req, res) => {
        Estudiantes.findAll()
            .then(estudiantes => {
                
                let respuesta = {
                    meta: {
                        status : 200,
                        total: estudiantes.length,
                        url: 'api/estudiantes'
                    },
                    data: estudiantes
                }   
                console.log("Se muestra API de Estudiantes");
                res.json(respuesta);
                })  
    }
}

module.exports = estudiantesApiController;

