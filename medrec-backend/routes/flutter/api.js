// const { application } = require("express");
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

/*
**************
**************
ONLY FOR FLUTTER!!
*/
isLoggedIn = true
/*
**************
**************
*/

// Login Screen
// Signup Screen
// Dashboard       ------ frontend
    // Edit doctor profile
    // Add new patient
    // Search Screen
// Patient Info Screen (diseases)
// Disease screen
// Prescription Screen ---- frontend (from disease object)

/*




*/
// Login Screen
router.post("/login", async (req, res) => {
    const doctor = await Doctor.find({email: req.body.email})
    res.json(doctor);
})
/*




*/
// Signup Screen
router.post("/signup", async (req, res) => {
    /**
     * req.body {
     * email
     * specialization
     * gender
     * p_no
     * }
     */
    // verified.
    const doctorData = req.body
    doctorData.verified = true
    const doctor = await Doctor.create(doctorData);
    res.json(doctor);
})
/*




*/
// Edit doctor profile
router.post("/editdoctor", async (req, res) => {
    const newDoctor = req.body;
    let doctor = await Doctor.findOne({email: newDoctor.email});
    doctor = newDoctor;
    const updatedDoctor = await doctor.save();
    res.json(updatedDoctor);
})
/*




*/
// Add new patient
router.post("/addPatient", async (req, res) => {
    const patient = req.body;
    const response = await Patient.create(patient);
    res.json(response);
})
/*




*/
// Search Screen
// Patient Info Screen (diseases)
router.get("/patientinfo", async (req, res) => {
    console.log("patientInfo");
    const { abha } = req.body;  // aadhar card
    const patient = await Patient.findOne({abha: abha}).populate("diseases");
    res.json(patient);
})
router.post("/newDisease", async (req, res) => {
    const disease = await Disease.create(req.body);
    res.json(disease);
})
/*




*/
// Disease screen
router.get("/diseaseinfo", async (req, res) => {
    const diseaseId = req.body.id;
    const disease = await Disease.findById(diseaseId).populate("prescriptions")
    res.json(disease)
})
router.post("/addprescription", async (req, res) => {
    const prescription = await Prescription.create(req.body);
    res.json(prescription);
    
})

module.exports = router;
