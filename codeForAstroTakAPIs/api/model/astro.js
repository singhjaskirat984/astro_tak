const mongoose = require('mongoose');

const innerImageSchema = new mongoose.Schema({
    imageUrl:String,
    id:String
})

const imagesSchema =  new mongoose.Schema({
    large: innerImageSchema,
    medium: innerImageSchema
})

const slotSchema =  new mongoose.Schema({
    toFormat:String,
    fromFormat:String,
    from:String,
    to:String
})

const availabiltySchema = new mongoose.Schema({
    days: [String],
    slot: slotSchema,
})



const astrologerSchema = new mongoose.Schema({
    id:Number,
    urlSlug: String,
    namePrefix: String,
    firstName: String,
    lastName: String,
    aboutMe: String,
    profliePicUrl: String,
    experience: Number,
    languages: [],
    minimumCallDuration: Number,
    minimumCallDurationCharges: Number,
    additionalPerMinuteCharges : Number,
    isAvailable: Boolean,
    rating: String,
    skills: [],
    isOnCall: Boolean,
    images:[imagesSchema],
    availability: [availabiltySchema]
})

module.exports = mongoose.model('Astrologer', astrologerSchema);