const express = require ('express');
const administradoresController =  require('../controllers/administradoresController');
const administradoresRouters = express.Router();


administradoresRouters.get('/', administradoresController.index);


module.exports = administradoresRouters;
