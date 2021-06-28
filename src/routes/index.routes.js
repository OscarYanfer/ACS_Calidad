const express = require('express');
const router = express.Router();
const pool = require('../database');
const Index = require('../controllers/index.controller')

router.get('/en', Index.indexENGet);


/*
router.post('/', Index.indexPost);

router.get('/nosotros', Index.nosotros);

router.get('/error', Index.error);
*/
module.exports = router;