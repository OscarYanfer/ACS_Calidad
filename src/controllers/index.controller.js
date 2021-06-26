const express = require('express');
const pool = require('../database');

index = async(req, res) => {
    const {
        firstname,
        secondname,
        company_name,
        phone_number,
        email
    } = req.body;

    const full_name = firstname + secondname;

    const newU = {
        full_name,
        company_name,
        phone_number,
        email
    }

    await pool.query("INSERT INTO contact_datas SET ?", [newU]);

    res.render('index/index');
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


module.exports = { index, nosotros, info, error };