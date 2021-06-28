const passport = require('passport');

Rget = async(req, res) => {
    //res.render('auten/registro');

    admin = {
        username: "Aseguramiento2021",
        password: "FISI2021"
    };

    admin.password = await helpers.encryptPassword(password);

    await pool.query('INSERT INTO pcso_admin SET ?', [admin]);

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
    res.render('auten/signin');
    return next();
}

Ipost = async(req, res, next) => {
    passport.authenticate('local.signin', {
        successRedirect: '/admin/list',
        failureRedirect: '/admin',
        failureFlash: true
    })(req, res, next);
}

Out = async(req, res, next) => {
    req.logOut();
    res.redirect('/');
}

module.exports = { Rget, Rpost, Iget, Ipost, Out };