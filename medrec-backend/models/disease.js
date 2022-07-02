const mongoose = require("mongoose");

const diseaseSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  prescriptions: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Prescription",
    },
  ],
  lastprescriptiondate: {
    type: Date,
  },
});

module.exports = mongoose.model("Disease", diseaseSchema);
