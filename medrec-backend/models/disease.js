const { Schema, model } = require("mongoose");

const diseaseSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  prescriptions: [
    {
      type: Schema.Types.ObjectId,
      ref: "prescription",
    },
  ],
  lastprescriptiondate: {
    type: Date,
    required: true,
  },
});
