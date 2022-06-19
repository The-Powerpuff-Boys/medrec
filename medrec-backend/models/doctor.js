const { Schema, model } = require("mongoose");
const passportLocalMongoose = require("passport-local-mongoose");

const doctorSchema = new Schema({
  email: {
    type: String,
    unique: true,
  },
});

doctorSchema.plugin(passportLocalMongoose);

const Doctor = model("Doctor", doctorSchema);

module.exports = Doctor;
