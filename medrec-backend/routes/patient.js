const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register, create } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const Patient = require("../models/patient");
const Disease = require("../models/disease");
const { isLoggedIn } = require("../middleware"); 
const { route } = require("./user");

router.get("/new", isLoggedIn, (req, res) => {
  res.render("newpatient");
});

router.post("/new", async (req, res) => {
  const { name, age, gender, abha } = req.body;
  const newPatientDetails = { name, age, gender, abha };
  newPatientDetails.diseases = [];

  const diseases = ["yellow fever", "cholera", "jaundice"];
  for (let i = 0; i < diseases.length; i++) {
    let disease = await Disease.create({ name: diseases[i] });
    newPatientDetails.diseases.push(disease._id);
  }

  const newPatient = await new Patient(newPatientDetails);
  await newPatient.save();
  res.send(newPatient);
  // res.redirect("/");
});

router.get("/", (req, res) => {
  res.render("patientinfo");
});

router.post("/", async (req, res) => {
  const { abha } = req.body;
  const patient = await Patient.findOne({ abha });
  const diseasesArray = []
  for (let i=0; i < patient.diseases.length; i++) {
    const disease = await Disease.findById(patient.diseases[i]);
    diseasesArray.push(disease);
  }
  res.send(diseasesArray);

  // const yoyo = await patient.populate("diseases");
  // console.log(yoyo);
});

module.exports = router;
