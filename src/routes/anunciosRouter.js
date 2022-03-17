const express = require ('express');

const anunciosController =  require('../controllers/anunciosController');

const anunciosRouters = express.Router();

anunciosRouters.get('/crear', anunciosController.crear);
//anunciosRouter.post('/crear', anunciosController.crearPost);

module.exports = anunciosRouters;
