const express = require ('express');

//validaciones
const subirAnuncio = require('../middlewares/subirAnuncio');
const crearAnuncioMiddleware = require('../middlewares/crearAnuncioMiddleware');
//controladores
const anunciosController =  require('../controllers/anunciosController');
const anunciosRouter = express.Router();

anunciosRouter.get('/crear', anunciosController.crear);
anunciosRouter.post('/crear', subirAnuncio.single('archivoAnuncio'), crearAnuncioMiddleware,anunciosController.crearPost);
anunciosRouter.get('/:id', anunciosController.detalle)
anunciosRouter.get('/editar/:id', anunciosController.editar);
anunciosRouter.post('/editar/:id',subirAnuncio.single('archivoAnuncio'),  anunciosController.actualizar);
anunciosRouter.get('/borrar/:id', anunciosController.borrar);
anunciosRouter.post('/borrar/:id', anunciosController.destruir);


//anunciosRouter.get('/listado', anunciosController.listado);


module.exports = anunciosRouter;

