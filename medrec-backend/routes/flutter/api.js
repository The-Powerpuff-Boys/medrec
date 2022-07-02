const express = require("express");
// const passport = require("passport");
const { register } = require("../../models/doctor");
const router = express.Router();
const Doctor = require("../../models/doctor");
const Patient = require("../../models/patient");
const Disease = require("../../models/disease");
const Prescription = require("../../models/prescription");
// const { isLoggedIn } = require("../../middleware");
const { route } = require(".././user");
const { default: mongoose } = require("mongoose");
const { update } = require("../../models/doctor");

// Completed Routes

router.post("/signup", async (req, res) => {
  try {
    const { email, username, password } = req.body;
    const fname = "dsad";
    const specialization = "MBBS";
    const gender = "no";
    const p_no = 876876687;
    const doctor = await new Doctor({
      username,
      fname,
      email,
      specialization,
      gender,
      p_no,
    });
    const newDoctor = await Doctor.register(doctor, password);
    res.status(200).send("Success");
  } catch (error) {
    console.log(error);
    res.status(400).send("Failed");
  }
});

router.put("/signup", async (req, res) => {
  try {
    const { fname, specialization, gender, p_no, docid } = req.body;
    const newDoctor = await Doctor.updateOne(
      { _id: docid },
      { $set: { fname, specialization, gender, p_no } }
    );
    res.status(200).send("Success");
  } catch (error) {
    console.log(error);
    res.status(400).send("Failed");
  }
});

router.get("/pres/:id", async (req, res) => {
  const pres = await Prescription.findById(req.params.id);
  res.json(pres);
});

router.post("/addpres/:id", async (req, res) => {
  try {
    const { doctorid, date, patientdesc, doctordesc, medicines } = req.body;
    const newPres = await new Prescription({
      date,
      doctorid,
      patientdesc,
      doctordesc,
      medicines,
    });
    await newPres.save();
    const disease = await Disease.findById(req.params.id).populate(
      "prescriptions"
    );
    await Disease.updateOne(
      { _id: req.params.id },
      { $push: { prescriptions: newPres } }
    );
    await disease.save();
    res.status(200).send("Success");
  } catch (error) {
    console.log(error);
    res.status(400).send("Failed");
  }
});

router.get("/patientinfo/:abha", async (req, res) => {
  try {
    const abha = req.params.abha;
    const patient = await Patient.findOne({ abha }).populate("diseases");
    res.json(patient);
  } catch (error) {
    console.log(error);
    res.status(400).send("Failed");
  }
});

router.post("/addpatient", async (req, res) => {
  try {
    const { fname, gender, abha, age } = req.body;
    const newPatient = await new Patient({ name: fname, age, gender, abha });
    await newPatient.save();
    res.status(200).send("Success");
  } catch (error) {
    console.log(error);
    res.status(400).send("Failed");
  }
});

router.get("/disease/:abha", async (req, res) => {
  try {
    const abha = req.params.abha;
    const patient = await Patient.findOne({ abha }).populate("diseases");
    res.json(patient);
  } catch (error) {
    console.log(error);
    res.status(400).send("Failed");
  }
});

router.post("/newdisease", async (req, res) => {
  try {
    const { name, abha } = req.body;
    const newDisease = await new Disease({ name: name }).populate(
      "prescriptions"
    );
    newDisease.save();
    await Patient.updateOne(
      { abha: abha },
      { $push: { diseases: newDisease } }
    );
    res.json(newDisease);
  } catch (error) {
    console.log(error);
    res.status(400).send("Failed");
  }
});

module.exports = router;
