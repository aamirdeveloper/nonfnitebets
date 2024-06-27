const express = require("express");
const bodyParser = require('body-parser');
const cors = require("cors");


const app = express();

app.use(express.json());

app.use(express.urlencoded({ extended: false }));

// const loginRoute = require('./routes/login');
const registerRoute = require('./routes/register');
const transactionRoute = require('./routes/transaction');
const betsRoute = require('./routes/bets');
const userRoute = require('./routes/user');

//admin routes
const adminRoute = require('./routes/admin');

app.use(bodyParser.json());
app.use(cors());


// app.use("/user", loginRoute);
app.use("/register", registerRoute);
app.use("/transaction", transactionRoute);
app.use("/bets", betsRoute);
app.use("/user", userRoute);

//admin routes
app.use("/admin", adminRoute);

app.use('/uploads', express.static('./uploads'));


module.exports = app;