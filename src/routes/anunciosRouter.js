const express = require ('express');

//validaciones
const subirAnuncio = require('../middlewares/subirAnuncio');

//controladores
const anunciosController =  require('../controllers/anunciosController');
const anunciosRouter = express.Router();

anunciosRouter.get('/crear', anunciosController.crear);
anunciosRouter.post('/crear', subirAnuncio.single('archivoAnuncio'), anunciosController.crearPost);
anunciosRouter.get('/:id', anunciosController.detalle)
anunciosRouter.get('/editar/:id', anunciosController.editar);
anunciosRouter.post('/editar/:id',subirAnuncio.single('archivoAnuncio'),  anunciosController.actualizar);
//anunciosRouter.get('/listado', anunciosController.listado);


module.exports = anunciosRouter;
