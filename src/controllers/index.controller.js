const express = require('express');
const pool = require('../database');

index = async(req, res) => {
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