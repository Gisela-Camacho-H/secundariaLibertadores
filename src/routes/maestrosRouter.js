const express = require ('express');

//validaciones

//controladores
const maestrosController =  require('../controllers/maestrosController');
const maestrosRouter = express.Router();

maestrosRouter.get('/listado', maestrosController.listado);
// maestrosRouter.get('/crear', maestrosController.crear);
// maestrosRouter.post('/crear', subirAnuncio.single('archivoAnuncio'), ,maestrosController.crearPost);
// maestrosRouter.get('/:id', maestrosController.detalle)
// maestrosRouter.get('/editar/:id', maestrosController.editar);
// maestrosRouter.post('/editar/:id',maestrosController.actualizar);
// maestrosRouter.get('/borrar/:id', maestrosController.borrar);
// maestrosRouter.post('/borrar/:id', maestrosController.destruir);


module.exports = maestrosRouter;

