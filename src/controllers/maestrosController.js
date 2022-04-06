const db = require('../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const {validationResult} = require("express-validator");

const Maestros = db.Maestro;
const Administradores = db.Administrador;


const maestrosController = {
    listado: (req, res) => {
        Maestros.findAll().
            then((maestros)=> {
                
                res.render('maestros/listadoMaestros', {maestros})
            })     
    },
    
};

module.exports = maestrosController;
