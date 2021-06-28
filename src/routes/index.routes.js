const express = require('express');
const router = express.Router();
const pool = require('../database');
const Index = require('../controllers/index.controller')

router.get('/en', Index.indexENGet);

router.post('/en', Index.indexENPost);

router.get('/es', Index.indexESGet);

router.post('/es', Index.indexESPost);

/*
router.post('/', Index.indexPost);

router.get('/nosotros', Index.nosotros);

router.get('/error', Index.error);
*/
module.exports = router;