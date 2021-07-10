const express = require('express');
const pool = require('../database');

indexGet = async(req, res) => {
    return res.redirect('/en');
}

indexENGet = async(req, res) => {
    return res.render('index/index');
}

indexENPost = async(req, res) => {
    const {
        full_name,
        company_name,
        phone_number,
        email
    } = req.body;

    const newU = {
        full_name,
        company_name,
        phone_number,
        email
    };

    await pool.query('INSERT INTO pcso_applicants set ?', [newU]);
    //await pool.query("INSERT INTO pcso_applicants values (" + full_name + ", " + company_name + "," + phone_number + "," + email + ",DATE_FORMAT(NOW(), '%H:%M:%S'),CURDATE()");
    return res.redirect('/en');
}


indexESGet = async(req, res) => {
    return res.render('index/index-spanish');
}

indexESPost = async(req, res) => {
    const {
        full_name,
        company_name,
        phone_number,
        email
    } = req.body;

    const newU = {
        full_name,
        company_name,
        phone_number,
        email
    };
    await pool.query('INSERT INTO pcso_applicants set ?', [newU]);


    //await pool.query('INSERT INTO pcso_applicants values (' + full_name + ',' + company_name + ',' + phone_number + ',' + email + ',' + 'DATE_FORMAT(NOW(), "%H:%i:%S")' + ',' + 'CURDATE()');
    //await pool.query("INSERT INTO pcso_applicants values (" + full_name + ", " + company_name + "," + phone_number + "," + email + "," + DATE_FORMAT(NOW(), '%H:%i:%S') + ", " + CURDATE());
    return res.redirect('/es');
}


/*
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
*/

module.exports = {
    indexGet,
    indexENGet,
    indexENPost,
    indexESGet,
    indexESPost
    /*
    nosotros,
    info,
    error
    */
};