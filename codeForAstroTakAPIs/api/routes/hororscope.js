const express = require("express");
const { response } = require("../../astrotak");
const router = express.Router();
const HororScope = require('../model/hororscope')

router.get('/',(req,res,next)=>{
   HororScope.find()
   .then(result=>{
       res.status(200).json({
           hororscopeData:result
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
    const hororscope = new HororScope({
        httpStatus: req.body.httpStatus,
        httpsStatusCode: req.body.httpsStatusCode,
        success: req.body.success,
        message: req.body.message,
        apiName: req.body.apiName,
        data: req.body.data
    })

    hororscope.save()
    .then(result=>{
        console.log(result)
        res.status(200).json({
            newhororscope: result
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