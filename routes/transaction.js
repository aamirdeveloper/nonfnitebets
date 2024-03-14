const express = require('express');
const transactionController = require("../controllers/transaction.controller");

const router = express.Router();

router.get('/list', transactionController.index)

module.exports= router;