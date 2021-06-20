const express = require('express');
const pool = require('../database');

usuarioGet = async(req, res) => {
    res.render('usuario/perfil');
    return next();
}

usuarioPost = async(req, res) => {
    res.redirect('/perfil');
    return next();
}

editarGet = async(req, res) => {
    const { id } = req.params;
    res.render('usuario/editar');
    return next();
}

editarPost = async(req, res) => {
    const { id } = req.params;
    res.render('usuario/editar/' + id);
    return next();
}

eliminar = async(req, res) => {
    const { id } = req.params;
    res.redirect('/perfil');
    return next();
}

module.exports = { usuarioGet, usuarioPost, editarGet, editarPost, eliminar };