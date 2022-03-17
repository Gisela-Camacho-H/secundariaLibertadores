const express = require ('express');
const tutoresController =  require('../controllers/tutoresController');
const tutoresRouters = express.Router();

tutoresRouters.get('/', tutoresController.index);

module.exports = tutoresRouters;
