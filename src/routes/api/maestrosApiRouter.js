const express = require ('express');

//controladores
const maestrosApiController =  require('../../controllers/api/maestrosApiController');
const maestrosApiRouter = express.Router();

//CRUD
maestrosApiRouter.get('/', maestrosApiController.listado);


module.exports = maestrosApiRouter;
