const express = require("express");
const { response } = require("../../astrotak");
const router = express.Router();
const Questions = require('../model/questions')

router.get('/',(req,res,next)=>{
    Questions.find()
   .then(result=>{
       res.status(200).json({
           questionsData:result
       })
   })

   .catch(err=>{
       console.log(err);
       res.status(500).json({
           error:err
       })
   })
})

router.post('/',(req,res,next)=>{
    const questions = new Questions({
        httpStatus: req.body.httpStatus,
        httpsStatusCode: req.body.httpsStatusCode,
        success: req.body.success,
        message: req.body.message,
        apiName: req.body.apiName,
        data: req.body.data
    })

    questions.save()
    .then(result=>{
        console.log(result)
        res.status(200).json({
            newQuestions: result
        })
    })

    .catch(err=>{
        console.log(err);
        res.status(500).json({
            error:err
        })
    })


})


module.exports = router;