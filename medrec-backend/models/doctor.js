const mongoose = require("mongoose");
const passportLocalMongoose = require("passport-local-mongoose");

const doctorSchema = new mongoose.Schema({
  email: {
    type: String,
    unique: true,
  },
  fname: {
    type: String,
    required: true,
  },
  specialization: {
    type: String,
    required: true,
  },
  gender: {
    type: String,
    required: true,
  },
  p_no: {
    type: Number,
    required: true,
  },
  verified: {
    type: Boolean,
  },
});

doctorSchema.plugin(passportLocalMongoose);

module.exports = mongoose.model("Doctor", doctorSchema);
