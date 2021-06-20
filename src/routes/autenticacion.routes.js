const express = require('express');
const router = express.Router();
const passport = require('passport');
const { isLoggedIn, isNotLoggedIn } = require('../lib/auth');
const Auth = require('../controllers/autenticacion.controller')

router.get('/registro', isNotLoggedIn, Auth.Rget);

router.post('/registro', isNotLoggedIn, Auth.Rpost);

router.get('/ingreso', isNotLoggedIn, Auth.Iget);

router.post('/ingreso', isNotLoggedIn, Auth.Ipost);

router.get('/salir', isLoggedIn, Auth.Out);

module.exports = router;