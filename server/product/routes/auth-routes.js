const express = require('express');

const authController = require('../controllers/auth-controller');

const authMiddleware = require('../middlewares/auth-middleware');

const router = express.Router();

router.post('/sign-up', authController.signUp);

router.post('/sign-in', authController.signIn);

router.post('/user-authentication', authController.userAuthentication);

router.post('/user', authMiddleware, )

module.exports = { router };