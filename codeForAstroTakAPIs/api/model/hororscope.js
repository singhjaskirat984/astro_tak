const mongoose = require('mongoose');

const innerImageSchema = new mongoose.Schema({
    imageUrl:String,
    id:String
})

const imagesSchema =  new mongoose.Schema({
    small: innerImageSchema,
    large: innerImageSchema,
    medium: innerImageSchema
})


const dataSchema = new mongoose.Schema({
    name:String,
    date:String,
    img:String,
    images:[imagesSchema],
    urlSlug:String
})

const hororscopeSchema = new mongoose.Schema({
    httpStatus: String,
    httpsStatusCode: Number,
    success: Boolean,
    message: String,
    apiName: String,
    data: [dataSchema]
})

module.exports = mongoose.model('HororScope', hororscopeSchema);