const express = require('express');
const pool = require('../database');

usuarioGet = async(req, res) => {
    const table = await pool.query("SELECT * FROM pcso_applicants");
    const admin = await pool.query("SELECT * FROM pcso_admin");

    res.render('admin/list', { table, admin });
    //return next();
}


usuarioPost = async(req, res) => {
    console.log(req.params);
    console.log(req.body);
    console.log("usuario_post");
    /*
    const { id_applicant } = req.params;
    const { id_admin } = req.user;

    newAfU = {
        id_applicant,
        id_admin
    }
    await pool.query('INSERT INTO pcso_admin_for_applicants SET ?', [newAfU]);
    */
    res.redirect('/admin/list');
}



editarGet = async(req, res) => {
    const { id } = req.params;
    const {state} = req.body;
    if (state === 1){
        state = 2;
    } else {
        state = 1;
    }
    await pool.query("UPDATE pcso_applicants set state=? where id =?",[state,id]);
    res.render('admin/update');
    //UPDATE trabajos set estado = ? WHERE id = ?
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
    await pool.query("DELETE FROM pcso_applicants WHERE id=?",[id]);
    res.redirect('/admin/list');
}

module.exports = { usuarioGet ,usuarioPost , editarGet, /*editarPost,*/ eliminar };