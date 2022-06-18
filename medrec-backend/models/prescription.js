const { Schema, model } = require("mongoose");

const prescriptionSchema = new Schema({
  date: {
    type: Date,
    required: true,
  },
  doctorId: {
    type: Schema.ObjectId,
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
