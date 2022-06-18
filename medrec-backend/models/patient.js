const { Schema, model, default: mongoose } = require("mongoose");

const patientSchema = new Schema({
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
  img: {
    type: String,
    required: true,
  },
  diseases: [
    {
      type: Schema.Types.ObjectId,
      ref: "disease",
    },
  ],
});
