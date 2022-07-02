const mongoose = require("mongoose");

const patientSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  age: {
    type: Number,
    required: true,
  },
  abha: {
    type: Number,
    required: true,
  },
  diseases: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Disease",
    },
  ],
});

module.exports = mongoose.model("Patient", patientSchema);
