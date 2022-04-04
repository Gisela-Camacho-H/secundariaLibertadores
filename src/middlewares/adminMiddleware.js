const path = require("path");
const { check, body } = require("express-validator");

module.exports = [
    body("UsuarioEmail")
        .notEmpty()
        .withMessage("Por favor ingrese su email")
        .isEmail()
        .withMessage("Por favor ingrese un email válido"),
    body("password")
        .notEmpty()
        .withMessage("Por favor ingrese contraseña correcta")
    
];
