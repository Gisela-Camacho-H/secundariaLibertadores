const express = require ('express');

//controladores
const anunciosApiController =  require('../../controllers/api/anunciosApiController');
const anunciosApiRouter = express.Router();

//CRUD
anunciosApiRouter.get('/', anunciosApiController.listado);


module.exports = anunciosApiRouter;
