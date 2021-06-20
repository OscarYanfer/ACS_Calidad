const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('./helpers');

passport.use('local.signin', new LocalStrategy({
    usernameField: '',
    passwordField: '',
    passReqToCallback: true
}, async(req) => {

}));

passport.use('local.signup', new LocalStrategy({
    usernameField: '',
    passwordField: '',
    passReqToCallback: true
}, async(req) => {

}));

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async(id, done) => {
    const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
    done(null, rows[0]);
});