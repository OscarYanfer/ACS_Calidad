const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('./helpers');

passport.use('local.signin', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async(req, username, password, done) => {
    const rows = await pool.query('SELECT * FROM pcso_users WHERE username = ?', [username]);
    if (rows.length > 0) {
        const user = rows[0];
        //const validPassword = await helpers.matchPassword(password, user.password)
        if (validPassword) {
            done(null, user);
        } else {
            //done(null, false, req.flash('message', 'Contraseña Incorrecta'));
            done(null, false);
        }
    } else {
        //return done(null, false, req.flash('message', 'El usuario no existe'));
        return done(null, false);
    }
}));

/*
passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async(req, username, password, done) => {

}));
*/

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async(id, done) => {
    const rows = await pool.query('SELECT * FROM pcso_users WHERE id = ?', [id]);
    done(null, rows[0]);
});