const express = require('express');

const authController = require('../controllers/auth-controller');

const router = express.Router();

router.post('/sign-up', authController.signUp);

router.post('/sign-in', authController.signIn);

module.exports = { router };