const models = require("../models");
const bycryptjs = require("bcryptjs");
const jwt = require('jsonwebtoken');
const helper = require('../helper');
const Validator = require('fastest-validator');
require('dotenv').config();

//Login function
function login(req, res){
    models.Admin.findOne({where:{email:req.body.email}}).then(result =>{
        if(result === null){
            res.status(200).json({
                status: 0,
                message: "Invalid Credentials"
            });
        }else{
            bycryptjs.compare(req.body.password, result.password, function(err, results){
                if(results){
                    let jwtSecretKey = process.env.JWT_SECRET_KEY;
                    let data = {
                        time: Date(),
                        email: result.email,
                        adminId: result.id
                    }
                    const token = jwt.sign(data, jwtSecretKey);
                    var arr = {
                        status: 1, 
                        "message": "login successfull",
                        "adminId": result.id,
                        "email": result.email,
                        "name": result.name,
                        "token": token
                    };

                    res.status(200).json(arr);
                }else{
                    res.status(200).json({
                        status: 0,
                        message: "Invalid Credentials"
                    });
                }
            });
        }
    }).catch(error => {
        res.status(200).json({
            status: 2,
            message: "Something went wrong"
        });
    });
}

function change_password(req, res) {
    let resp = helper.check_token(req);
    if(resp !== "Successfully Verified")
    {
        console.error(`Token error`, resp);
        res.json(resp);
    }
    else
    {
        const post = {
            currentPassword: req.body.currentPassword,
            newPassword: req.body.newPassword
        }

        const schema = {
            currentPassword: {type: "string", optional: false},
            newPassword: {type: "string", optional: false}
        }

        const v = new Validator();
        const validationResponse = v.validate(post, schema);

        if(validationResponse !== true){
            return res.status(200).json({
                status: 0,
                message: "validation failed",
                errors: validationResponse
            });
        }

        let login_data = helper.get_adminId_token(req);
        const adminId = login_data.adminId;

        models.Admin.findOne({where:{id:adminId}}).then(result =>{
            if(result === null){
                res.status(200).json({
                    status: 0,
                    message: "Invalid token"
                });
            }else{
                bycryptjs.compare(req.body.currentPassword, result.password, function(err, results){
                    if(results){
                        bycryptjs.genSalt(10, function(err, salt){
                            bycryptjs.hash(req.body.newPassword, salt, function(err, hash){
                                const dt = {
                                    password: hash
                                }
                            
                                models.Admin.update(dt, {where:{
                                    id:adminId
                                }}).then(result => {
                                    res.status(200).json({
                                        status: 1,
                                        message: "Password updated"
                                    });
                                }).catch(error => {
                                    res.status(200).json({
                                        status: 0,
                                        message: "Something went wrong!"
                                    });
                                });
                            });
                        });
                    }else{
                        res.status(200).json({
                            status: 0,
                            message: "Current password is incorrect"
                        });
                    }
                });
            }
        }).catch(error => {
            res.status(200).json({
                status: 2,
                message: "Something went wrong"
            });
        });
    }
}

function users(req, res){
    let resp = helper.check_token(req);
    if(resp !== "Successfully Verified")
    {
        console.error(`Token error`, resp);
        res.json(resp);
    }
    else
    {
        models.User.findAll().then(result => {
            const users_list = [];
            for (var i = 0; i <= result.length - 1; i++) {
                var single = {
                    "id": result[i].id,
                    "name": result[i].name,
                    "email": result[i].email,
                    "phone": result[i].phone,
                    "userBalance": result[i].userBalance,
                    "createdAt": result[i].createdAt,
                };
                users_list.push(single);
            }
            res.status(200).json({
                status: 1,
                data: users_list
            });
        }).catch(error => {
            res.status(200).json({
                status: 2,
                message: "Something went wrong!",
                error: error
            });
        });
    }
}

function bets(req, res){
    let resp = helper.check_token(req);
    if(resp !== "Successfully Verified")
    {
        console.error(`Token error`, resp);
        res.json(resp);
    }
    else
    {
        models.Bet.findAll().then(result => {
            res.status(200).json({
                status: 1,
                data: result
            });
        }).catch(error => {
            res.status(200).json({
                status: 2,
                message: "Something went wrong!",
                error: error
            });
        });
    }
}

function pendingMatches(req, res) {
    let resp = helper.check_token(req);
    if(resp !== "Successfully Verified")
    {
        console.error(`Token error`, resp);
        res.json(resp);
    }
    else
    {
        models.Match.findAll({
            where: {
                status: 0
            }
        }).then(result => {
            res.status(200).json({
                status: 1,
                data: result
            });
        }).catch(error => {
            res.status(200).json({
                status: 2,
                message: "Something went wrong!",
                error: error
            });
        });
    }
}

function setMatchesLive(req, res) {
    let resp = helper.check_token(req);
    if(resp !== "Successfully Verified")
    {
        console.error(`Token error`, resp);
        res.json(resp);
    }
    else
    {
        const post = {
            matchIds: req.body.matchIds
        }

        const schema = {
            matchIds: {type: "array", optional: false}
        }

        const v = new Validator();
        const validationResponse = v.validate(post, schema);

        if(validationResponse !== true){
            return res.status(200).json({
                status: 0,
                message: "validation failed",
                errors: validationResponse
            });
        }

        const dt = {
            status: 1
        }
        
        models.Match.update(dt, {where:{
            id: post.matchIds
        }}).then(result => {
            res.status(200).json({
                status: 1,
                message: "Data updated"
            });
        }).catch(error => {
            res.status(200).json({
                status: 0,
                message: "Something went wrong!"
            });
        });
    }
}

module.exports = {
    login: login,
    change_password: change_password,
    users: users,
    bets: bets,
    pendingMatches: pendingMatches,
    setMatchesLive: setMatchesLive
}