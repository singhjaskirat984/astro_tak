const express = require("express");
const app = express();
const horrorscopeRoute = require('./api/routes/hororscope')
const astrologerRoute = require('./api/routes/astro')
const questionsRoute = require('./api/routes/questions')
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

mongoose.connect('mongodb+srv://jaskirat:jaskirat1998@astrotak.x1lg7.mongodb.net/myFirstDatabase?retryWrites=true&w=majority')

mongoose.connection.on('error',err=>{
    console.log('connection failure')
})

mongoose.connection.on('connected',connected=>{
    console.log('connected with database....')
})

app.use(bodyParser.urlencoded({encoded:false}));
app.use(bodyParser.json());

app.use('/hororscope',horrorscopeRoute);
app.use('/astrologer',astrologerRoute);
app.use('/questions',questionsRoute);


// app.use((req,res,next)=>{
//     res.status(200).json({
//         message:"app is running",
//     })
// })

app.use((req,res,next)=>{
    res.status(404).json({
        error:"bad Request",
    })
})

module.exports = app;