const express = require ('express');

//validaciones
const subirAnuncio = require('../middlewares/subirAnuncio');

//controladores
const anunciosController =  require('../controllers/anunciosController');
const anunciosRouter = express.Router();

//anunciosRouter.get('/', anunciosController.index);
anunciosRouter.get('/crear', anunciosController.crear);
anunciosRouter.post('/', subirAnuncio.single('archivoAnuncio'), anunciosController.crearPost);
anunciosRouter.get('/listado', anunciosController.listado);

module.exports = anunciosRouter;
