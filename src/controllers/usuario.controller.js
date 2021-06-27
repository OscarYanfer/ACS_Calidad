const express = require('express');
const pool = require('../database');

usuarioGet = async(req, res) => {
    const table = await pool.query("SELECT * FROM PCSO_admin");
    res.render('admin/list', { table });
    return next();
}

usuarioPost = async(req, res) => {
    res.redirect('/admin/list');
    return next();
}

editarGet = async(req, res) => {
    const { id } = req.params;
    res.render('admin/update');
    return next();
}

editarPost = async(req, res) => {
    const { id } = req.params;
    res.rendedirect('/admin/list');
    return next();
}

eliminar = async(req, res) => {
    const { id } = req.params;
    res.redirect('/admin/list');
    return next();
}

module.exports = { usuarioGet, usuarioPost, editarGet, editarPost, eliminar };