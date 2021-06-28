const passport = require('passport');
const helpers = require('../lib/helpers');
const pool = require('../database');

Rget = async(req, res) => {
    //res.render('auten/registro');

    admin = {
        username: "Aseguramiento2021",
        password: "FISI2021"
    };


    //admin.password = await helpers.encryptPassword(admin.password);

    await pool.query('INSERT INTO pcso_admin SET ?', [admin]);
    res.redirect('/admin');
    return next();
}

Rpost = async(req, res) => {
    /*
    passport.authenticate('local.signup', {
        successRedirect: '/admin',
        failureRedirect: '/registro',
        failureFlash: true 
    }) 
    */
    return next();
}

Iget = async(req, res) => {
    const admin = await pool.query('SELECT * FROM pcso_admin');
    res.render('auten/signin', { admin });
    //return next();
}


Ipost = async(req, res, next) => {
    const { username, password } = req.body;



    const rows = await pool.query('SELECT * FROM pcso_admin WHERE username = ?', [username]);
    if (rows.length > 0) {
        const user = rows[0];

        const validPassword = password == user.password;

        if (validPassword) {
            res.redirect('/admin/list');
        } else {
            res.redirect('/admin');
        }
    }


    /*
    passport.authenticate('local.signin', {
        successRedirect: '/admin/list',
        failureRedirect: '/admin',
        failureFlash: true
    })(req, res, next);
    */
}

Out = async(req, res, next) => {
    req.logOut();
    res.redirect('/en');
}

module.exports = { Rget, Rpost, Iget, Ipost, Out };