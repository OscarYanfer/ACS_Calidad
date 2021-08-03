const express = require('express');
const pool = require('../database');

usuarioGet = async(req, res) => {
    const table = await pool.query("SELECT * FROM pcso_applicants");
    const admin = await pool.query("SELECT * FROM pcso_admin");

    res.render('admin/list', { table, admin });
    //return next();
}

/*
    usuarioPost = async(req, res) => {
        
                const { id_applicant } = req.params;
                const { id_admin } = req.user;

                newAfU = {
                    id_applicant,
                    id_admin
                }
                await pool.query('INSERT INTO pcso_admin_for_applicants SET ?', [newAfU]);
        
res.redirect('/admin/list');
return next();
}
*/


editarGet = async(req, res) => {
    const { id } = req.params;
    const usuario = await pool.query("SELECT * FROM pcso_applicants WHERE id=?",[id]);
    console.log(req.body);
    res.render('admin/update');
    return next();
}

/*
editarPost = async(req, res) => {
    const { id } = req.params;
    res.rendedirect('/admin/list');
    return next();
}
*/
eliminar = async(req, res) => {
    const { id } = req.params;
    res.redirect('/admin/list');
    return next();
}

module.exports = { usuarioGet /*,usuarioPost*/ , editarGet, /*editarPost,*/ eliminar };