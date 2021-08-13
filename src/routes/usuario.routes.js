const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');
const Perfil = require('../controllers/usuario.controller');

router.get('/admin/list', Perfil.usuarioGet);

router.post('/admin/list', Perfil.usuarioPost);


router.get('/admin/update/:id', Perfil.editarGet);

/*
router.post('/admin/update/:id', isLoggedIn, Perfil.editarPost);

router.post('/admin/user/:id', isLoggedIn, Perfil.usuarioPost);
*/

router.get('/admin/delete/:id', Perfil.eliminar);

module.exports = router;