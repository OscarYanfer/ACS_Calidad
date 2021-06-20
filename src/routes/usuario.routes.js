const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');
const Perfil = require('../controllers/usuario.controller')

router.get('/perfil', isLoggedIn, Perfil.usuarioGet);

router.post('/perfil', isLoggedIn, Perfil.usuarioPost);

router.get('/perfil/editar/:id', isLoggedIn, Perfil.editarGet);

router.post('/perfil/editar/:id', isLoggedIn, Perfil.editarPost);

router.get('/perfil/eliminar/:id', isLoggedIn, Perfil.eliminar);

module.exports = router;