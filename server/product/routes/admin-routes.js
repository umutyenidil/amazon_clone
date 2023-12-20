const express = require('express');

const adminController = require('../controllers/admin-controller');

const authMiddleware = require('../middlewares/auth-middleware');

const router = express.Router();

router.post('/product/add', adminController.productAdd);
router.get('/products', adminController.products);



module.exports = { router };