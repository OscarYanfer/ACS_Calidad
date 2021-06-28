const express = require('express');
const router = express.Router();
const passport = require('passport');
const { isLoggedIn, isNotLoggedIn } = require('../lib/auth');
const Auth = require('../controllers/autenticacion.controller')

router.get('/signup', isNotLoggedIn, Auth.Rget);

//router.post('/registro', isNotLoggedIn, Auth.Rpost);

router.get('/signin', isNotLoggedIn, Auth.Iget);

router.post('/signin', isNotLoggedIn, Auth.Ipost);

router.get('/out', isLoggedIn, Auth.Out);

module.exports = router;