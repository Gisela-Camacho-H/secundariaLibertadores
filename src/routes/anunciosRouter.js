const express = require ('express');

//validaciones
const subirAnuncio = require('../middlewares/subirAnuncio');

//controladores
const anunciosController =  require('../controllers/anunciosController');
const mainRouters = require('../routes/mainRouter');
const anunciosRouter = express.Router();

anunciosRouter.get('/anuncios/crear', anunciosController.crear);
anunciosRouter.post('/anuncios/crear', subirAnuncio.single('archivoAnuncio'), anunciosController.crearPost);
anunciosRouter.get('/anuncios/:id', anunciosController.detalle)
anunciosRouter.get('/anuncios/editar/:id', anunciosController.editar);
anunciosRouter.post('/anuncios/editar/:id',subirAnuncio.single('archivoAnuncio'),  anunciosController.actualizar);
anunciosRouter.get('/anuncios/borrar/:id', anunciosController.borrar);
anunciosRouter.post('/anuncios/borrar/:id', anunciosController.destruir);


//anunciosRouter.get('/listado', anunciosController.listado);


module.exports = anunciosRouter;

