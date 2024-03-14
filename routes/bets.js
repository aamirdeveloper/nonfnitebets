const express = require('express');
const betsController = require("../controllers/bets.controller");

const router = express.Router();

router.get('/list', betsController.index)

module.exports= router;