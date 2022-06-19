const mongoose = require("mongoose");

const prescriptionSchema = new mongoose.Schema({
  date: {
    type: Date,
    required: true,
  },
  doctorId: {
    type: mongoose.Schema.ObjectId,
    required: true,
  },
  testreport: {
    type: Boolean,
    required: true,
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

module.expoort = mongoose.model("Prescription", prescriptionSchema);
