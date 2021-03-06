const express = require ('express');
const mainController =  require('../controllers/mainController');
const mainRouters = express.Router();

//const guestMiddleware = require('../middleware/guestMiddleware');

mainRouters.get('/', mainController.index);
mainRouters.get('/nosotros', mainController.nosotros);
mainRouters.get('/admision', mainController.admision);
mainRouters.get('/plan', mainController.plan);
mainRouters.get('/calendario', mainController.calendario);
mainRouters.get('/galeria', mainController.galeria);
mainRouters.get('/contacto', mainController.contacto);
mainRouters.get('/otros', mainController.otros);
mainRouters.get('/productos', mainController.productos);
mainRouters.get('/register', mainController.register);


module.exports = mainRouters;
