const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const Patient = require("../models/patient");
const { isLoggedIn } = require("../middleware");
const { route } = require("./user");

router.get("/", (req, res) => {
  res.render("patientinfo");
});

router.post("/", async (req, res) => {
  const { abha } = req.body;
  const patient = await Patient.findOne({ abha }).populate({ path: "disease" });
  console.log(patient);
});

module.exports = router;
