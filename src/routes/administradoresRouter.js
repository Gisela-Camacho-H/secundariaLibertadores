const express = require ('express');
const administradoresController =  require('../controllers/administradoresController');
const administradoresRouters = express.Router();

const adminMiddleware = require('../middlewares/adminMiddleware');
const guestMiddleware = require('../middlewares/guestMiddleware');
const authMiddleware = require('../middlewares/authMiddleware');

administradoresRouters.get('/login', administradoresController.login);
administradoresRouters.post('/login', adminMiddleware, administradoresController.loginAcceso)
administradoresRouters.get('/cerrarSesion', administradoresController.cerrarSesion)
//administradoresRouters.get('/registrar', guestMiddleware ,administradoresController.registrar);

module.exports = administradoresRouters;
 