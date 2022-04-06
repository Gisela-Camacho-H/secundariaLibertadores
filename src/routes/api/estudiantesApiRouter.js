const express = require ('express');

//controladores
const estudiantesApiController =  require('../../controllers/api/estudiantesApiController');
const estudiantesApiApiRouter = express.Router();

//CRUD
estudiantesApiApiRouter.get('/', estudiantesApiController.listado);


module.exports = estudiantesApiApiRouter;
