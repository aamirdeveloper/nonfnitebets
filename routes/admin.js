const express = require('express');
const adminController = require("../controllers/admin.controller");

const router = express.Router();

router.post('/login', adminController.login)
router.post('/change-password', adminController.change_password)

// router.get('/dashboard', adminController.index)
router.get('/users', adminController.users)
router.get('/bets', adminController.bets)

module.exports= router;