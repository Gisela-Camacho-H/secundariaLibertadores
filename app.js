const express = require('express');
const path = require('path');

const app = express();

const port = process.env.PORT || 3000;

// Reconocimeinto de ruta a carpeta public(css, img, js, etc. )
const publicPath =path.resolve(__dirname, 'public');
app.use(express.static(publicPath));

// Creación de rutas 
const mainRouter = require('./src/routes/mainRouter');
const administradoresRouter = require('./src/routes/administradoresRouter');
const maestrosRouter = require('./src/routes/maestrosRouter');
const tutoresRouter = require('./src/routes/tutoresRouter');
const anunciosRouter = require('./src/routes/anunciosRouter');

app.use('/', mainRouter);
app.use('/administrador', administradoresRouter);
app.use('/maestros', maestrosRouter);
app.use('/tutores', tutoresRouter);
app.use('/anuncios', anunciosRouter);

// Motor de vistas
app.set('view engine','ejs');
app.set('views', path.join(__dirname, './src/views'));

app.listen(process.env.PORT || port, () => console.log(`Servidor corriendo en puerto ${port}`));
