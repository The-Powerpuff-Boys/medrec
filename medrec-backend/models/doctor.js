const { Schema, model } = require("mongoose");
const passportLocalMongoose = require("passport-local-mongoose");

const doctorSchema = new Schema({
  email: {
    type: String,
    unique: true,
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
});

doctorSchema.plugin(passportLocalMongoose);

const Doctor = model("Doctor", doctorSchema);

module.exports = Doctor;
