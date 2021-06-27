const passport = require('passport');

Rget = async(req, res) => {
    //res.render('auten/registro');

    admin = [{
        username: "admin1",
        password: "pass1"
    }, {
        username: "admin2",
        password: "pass2"
    }, {
        username: "admin3",
        password: "pass3"
    }, {
        username: "admin4",
        password: "pass4"
    }, {
        usename: "admin5",
        password: "pass5"
    }];
    /*
    username = ["admin1", "admin2", "admin3", "admin4", "admin5"];
    password = ["pass1", "pass2", "pass3", "pass4", "pass5"];
    console.log("objeto:" + admin[2].username);
    console.log(username[0]);
    console.log(password[0]);
    */

    for (i = 0; i < admin.length; i++) {
        const row = await pool.query('SELECT * FROM PCSO_users WHERE username = ?', [admin[i].username]);
        if (row.length > 0) {
            continue;
        } else {
            newU = {
                username: admin[i].usename,
                password: admin[i].password
            };
            await pool.query('INSERT INTO PCSO_users SET ?', [newU]);
        }
    }

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