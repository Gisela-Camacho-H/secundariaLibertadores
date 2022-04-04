const db = require('../database/models');
const path = require('path');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const {validationResult} = require("express-validator");
const bcryptjs = require("bcryptjs");


const Administradores = db.Administrador;

const adminController = {
    login: (req, res) => {
        res.render('administradores/login')
    },
    loginAcceso: async (req, res) => {
        const resultValidation = validationResult(req);

            
        if (resultValidation.errors.length > 0) {
            return res.render('administradores/login',{
                errors: resultValidation.mapped(),
                oldData:req.body,
            });
        }else{
            let userToLogin = await Administradores.findOne({where: {email: req.body.UsuarioEmail}});

            if (userToLogin){
                console.log("USUARIO ENCONTRADO");
                let passwordOk = bcryptjs.compareSync(req.body.password, userToLogin.password)
                
                if (passwordOk){
                    delete userToLogin.password;
                    req.session.userLogged = userToLogin;
                    return res.redirect('/',{user: req.session.userLogged});
                }
                return res.render('administradores/login',{
                    errors: {
                        password:{
                            msg:'La contraseña es incorrecta',
                        }
                    },
                    oldData:req.body,
                })

            }else{
                console.log("USUARIO NO ENCONTRADO");
                return res.render("administradores/login", {
                    errors: {
                        UsuarioEmail: {
                            msg: "Correo no encontrado",
                      },
                    },
                  });
            }
        }
    },
    cerrarSesion:(req, res) => {
        req.session.destroy();
        res.redirect('/')
    },
};

module.exports = adminController;
