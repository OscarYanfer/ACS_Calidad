const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');
const Perfil = require('../controllers/usuario.controller')

router.get('/admin', isLoggedIn, Perfil.usuarioGet);

router.post('/admin', isLoggedIn, Perfil.usuarioPost);

router.get('/admin/update/:id', isLoggedIn, Perfil.editarGet);

router.post('/admin/update/:id', isLoggedIn, Perfil.editarPost);

router.get('/admin/delete/:id', isLoggedIn, Perfil.eliminar);

module.exports = router;