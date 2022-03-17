
const mainController = {
    index: (req, res) => {
        res.render('index')
    },
    nosotros: (req,res) =>{
        res.render('nosotros')
    },
    admision: (req,res) =>{
        res.render('admision')
    }, 
    plan: (req,res) =>{
        res.render('plan')
    }, 
    calendario: (req,res) =>{
        res.render('calendario')
    }, 
    galeria: (req,res) =>{
        res.render('galeria')
    }, 
    contacto: (req,res) =>{
        res.render('contacto')
    }, 
    otros: (req,res) =>{
        res.render('otros')
    }, 
    productos: (req,res) =>{
        res.render('productos')
    },
    register: (req, res) => {
        res.render('register')
    },
    login: (req, res) => {
        res.render('login')
    },
};


module.exports = mainController;