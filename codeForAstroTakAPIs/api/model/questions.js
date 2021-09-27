const mongoose = require('mongoose');

const dataSchema = new mongoose.Schema({
    id:Number,
    name:String,
    description:String,
    price:Number,
    suggestions:[String]
})

const questionsSchema = new mongoose.Schema({
    httpStatus: String,
    httpsStatusCode: Number,
    success: Boolean,
    message: String,
    apiName: String,
    data: [dataSchema]
})

module.exports = mongoose.model('Questions', questionsSchema);