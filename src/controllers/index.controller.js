const express = require('express');
const pool = require('../database');

indexGet = async(req, res) => {
    res.render('index/index');
    return next();
}

indexPost = async(req, res) => {
    const {
        firstname,
        lastname,
        company_name,
        phone_number,
        email
    } = req.body;

    var full_name = firstname + lastname;

    const newU = {
        full_name,
        company_name,
        phone_number,
        email
    };
    await pool.query('INSERT INTO contact_datas set ?', [newU]);
    res.redirect('index/index');
    return next();
}

nosotros = async(req, res) => {
    res.render('nosotros');
    return next();
}

info = async(req, res) => {
    res.render('info');
    return next();
}

error = async(req, res) => {
    res.render('error');
    return next();
}


module.exports = {
    indexGet,
    indexPost,
    nosotros,
    info,
    error
};