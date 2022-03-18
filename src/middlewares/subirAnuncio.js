const path = require('path');;
const multer = require('multer');

const storage = multer.diskStorage({
    destination:  (req, file, cb) => {
      cb(null, path.join(__dirname, "../../Public/img/anuncios"));
    },
    filename:  (req, file, cb) => {
      cb(null, `${Date.now()}_img_${path.extname(file.originalname)}`);
    },
  });
  
  const subirAnuncio = multer({ storage });
  
  module.exports = subirAnuncio;
  
  