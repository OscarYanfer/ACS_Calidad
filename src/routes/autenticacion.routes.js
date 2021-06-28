const express = require('express');
const router = express.Router();
const passport = require('passport');
const { isLoggedIn, isNotLoggedIn } = require('../lib/auth');
const Auth = require('../controllers/autenticacion.controller')

router.get('/signup', Auth.Rget);

//router.post('/registro', isNotLoggedIn, Auth.Rpost);

router.get('/admin', Auth.Iget);

router.post('/admin', Auth.Ipost);

router.get('/out', Auth.Out);

module.exports = router;