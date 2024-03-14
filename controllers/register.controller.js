const models = require("../models");
const bycryptjs = require("bcryptjs");
const jwt = require('jsonwebtoken');
const helper = require('../helper');
const Validator = require('fastest-validator');
require('dotenv').config();

//Signup function
function index(req, res){
    const post = {
        name: req.body.name,
        email: req.body.email,
        password: req.body.password,
    }

    const schema = {
        name: {type: "string", optional: false, empty: false},
        email: {type: "string", optional: false, empty: false},
        password: {type: "string", optional: false, empty: false}
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
    models.User.findOne({where:{email:req.body.email}}).then(result =>{
        if(result === null){
            bycryptjs.genSalt(10, function(err, salt){
                bycryptjs.hash(req.body.password, salt, function(err, hash){
                    
                    post.password = hash;
                
                    models.User.create(post).then(result => {
                        
                        let jwtSecretKey = process.env.JWT_SECRET_KEY;
                        let data = {
                            time: Date(),
                            email: post.email,
                            userId: post.id
                        }
                        const token = jwt.sign(data, jwtSecretKey);

                        res.status(200).json({
                            status: 1,
                            message: "Registered successfully",
                            post: result,
                            token: token
                        });
                    }).catch(error => {
                        res.status(200).json({
                            status: 2,
                            message: "Something went wrong",
                            error: error
                        });
                    });
                });
            });
            
        }else{
            res.status(200).json({
                status: 0,
                message: "Email already exists"
            });
        }
    }).catch(error => {
        res.status(200).json({
            status: 2,
            message: "Something went wrong"
        });
    });
}

module.exports = {
    index: index,
}