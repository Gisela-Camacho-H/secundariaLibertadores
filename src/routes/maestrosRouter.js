const express = require ('express');
const maestrosController =  require('../controllers/maestrosController');
const maestrosRouters = express.Router();

maestrosRouters.get('/', maestrosController.index);

module.exports = maestrosRouters;
