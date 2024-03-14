const express = require('express');
const loginController = require("../controllers/login.controller");

const router = express.Router();

router.post('/login', loginController.login)
router.post('/change-password', loginController.change_password)

module.exports= router;