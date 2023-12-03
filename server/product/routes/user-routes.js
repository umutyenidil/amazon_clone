const express = require('express');

const userController = require('../controllers/user-controller');

const router = express.Router();

router.get('/data',  userController.data);

module.exports = { router };