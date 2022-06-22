const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const Patient = require("../models/patient");
const Disease = require("../models/disease");
const Prescription = require("../models/prescription");
const { isLoggedIn } = require("../middleware");
const { route } = require("./user");

router.get("/:id/new", (req, res) => {
  res.render("newdisease");
});

router.get("/:id/new/:name", async (req, res) => {
  try {
    const diseasename = req.params.name;
    const abha = req.params.id;
    const newDisease = await new Disease({ name: diseasename }).populate(
      "prescriptions"
    );
    newDisease.save();
    await Patient.updateOne(
      { abha: abha },
      { $push: { diseases: newDisease } }
    );
    res.redirect(`/patientinfo/${abha}`);
  } catch (error) {
    console.log(error);
    res.render("error");
  }
});

module.exports = router;
