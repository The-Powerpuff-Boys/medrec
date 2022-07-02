const mongoose = require("mongoose");

const prescriptionSchema = new mongoose.Schema({
  date: {
    type: String,
    required: true,
  },
  doctorid: {
    type: mongoose.Schema.ObjectId,
    required: true,
  },
  testreport: {
    type: Boolean,
  },
  patientdesc: {
    type: String,
    required: true,
  },
  doctordesc: {
    type: String,
    required: true,
  },
  medicines: [
    {
      type: String,
    },
  ],
});

module.exports = mongoose.model("Prescription", prescriptionSchema);
