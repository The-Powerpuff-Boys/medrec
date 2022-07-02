const Doctor = require("../models/doctor");
const Patient = require("../models/patient");
const Disease = require("../models/disease");
const express = require("express");
var router = express.Router();
const passport = require("passport");
const { register, create } = require("../models/doctor");
const { isLoggedIn } = require("../middleware");
const { route } = require("./user");

router.get("/new", isLoggedIn, (req, res) => {
  res.render("newpatient");
});

router.post("/new", isLoggedIn, async (req, res) => {
  try {
    const { name, age, gender, abha } = req.body;
    const newPatient = await new Patient({ name, age, gender, abha });
    await newPatient.save();
    res.redirect("/home");
  } catch (error) {
    console.log(error);
    res.render("error");
  }
});

router.get("/", isLoggedIn, (req, res) => {
  res.render("patientinfo");
});

router.get("/:id", isLoggedIn, async (req, res) => {
  try {
    const abha = req.params.id;
    const patient = await Patient.findOne({ abha }).populate("diseases");
    if (!patient) res.redirect("/patientinfo");
    else {
      res.render("showdisease", { patient });
    }
  } catch (error) {
    console.log(error);
    res.render("error");
  }
});

module.exports = router;
