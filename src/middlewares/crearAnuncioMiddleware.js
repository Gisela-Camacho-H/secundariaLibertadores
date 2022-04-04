const path = require("path");
const { check, body } = require("express-validator");

module.exports = [
    body("titulo")
        .notEmpty()
        .withMessage("Por favor ingrese un titulo")
        .isLength({ min: 4 })
        .withMessage("Por favor ingrese  al menos 4 caracteres"),
    body("descripcion")
        .notEmpty()
        .withMessage("Por favor ingrese de 10 a 450 caracteres")
        .isLength({ min: 10 }),
    body("archivoAnuncio")
        .custom((value, {req}) => {
            let file = req.file;
            let accedtedExtensions = ['.jpg', '.png', '.jpeg'];
            if (!file){
                throw new Error('Por favor ingresa una imagen');
            } 
            else{
                let fileExtension = path.extname(file.originalname);
                if (!accedtedExtensions.includes(fileExtension)){
                    throw new Error(
                        `Las extensiones de imagen permitidas son ${acceptedExtensions.join(",")}`
                      );
                }
            }
            return true;    
            
        }),
];
