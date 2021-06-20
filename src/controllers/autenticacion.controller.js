const passport = require('passport');

Rget = async(req, res) => {
    res.render('auten/registro');
    return next();
}

Rpost = async(req, res) => {
    passport.authenticate('local.signup', {
        successRedirect: '/perfil',
        failureRedirect: '/registro',
        failureFlash: true
    })
    return next();
}

Iget = async(req, res) => {
    res.render('auten/ingreso');
    return next();
}

Ipost = async(req, res, next) => {
    passport.authenticate('local.signin', {
        successRedirect: '/perfil',
        failureRedirect: '/ingreso',
        failureFlash: true
    })(req, res, next);
}

Out = async(req, res, next) => {
    req.logOut();
    res.redirect('/');
}

module.exports = { Rget, Rpost, Iget, Ipost, Out };