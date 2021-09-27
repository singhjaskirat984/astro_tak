const express = require("express");
const { response } = require("../../astrotak");
const router = express.Router();
const Astrologer = require('../model/astro')

router.get('/',(req,res,next)=>{
    Astrologer.find()
   .then(result=>{
       res.status(200).json({
        AstrologerData:result
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
    const astrologer = new Astrologer({
            id:req.body.id,
            urlSlug: req.body.urlSlug,
            namePrefix: req.body.namePrefix,
            firstName: req.     body.firstName,
            lastName: req.body.lastName,
            aboutMe: req.body.aboutMe,
            profliePicUrl: req.body.profliePicUrl,
            experience: req.body.experience,
            languages: req.body.languages,
            minimumCallDuration: req.body.minimumCallDuration,
            minimumCallDurationCharges: req.body.minimumCallDurationCharges,
            additionalPerMinuteCharges : req.body.additionalPerMinuteCharges,
            isAvailable: req.body.isAvailable,
            rating: req.body.rating,
            skills: req.body.skills,
            isOnCall: req.body.isOnCall,
            images:req.body.images,
            availability: req.body.availability
    })

    astrologer.save()
    .then(result=>{
        console.log(result)
        res.status(200).json({
            newAstrologer: result
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