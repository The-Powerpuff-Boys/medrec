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

router.get("/:id", isLoggedIn, async (req, res) => {
  try {
    const disease = await Disease.findById(req.params.id).populate(
      "prescriptions"
    );
    res.render("presindex", { disease });
  } catch (error) {
    console.log(error);
    res.render("error");
  }
});

router.get("/:id/new", isLoggedIn, (req, res) => {
  try {
    const diseaseId = req.params.id;
    res.render("newpres", { diseaseId });
  } catch (error) {
    console.log(error);
    res.render("error");
  }
});

router.post("/:id/new", async (req, res) => {
  try {
    const { date, patientdesc, doctordesc, medicines } = req.body;
    const doctorid = req.user._id;
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
    res.redirect(`/prescription/${req.params.id}`);
  } catch (error) {
    console.log(error);
    res.render("error.ejs");
  }
});

router.get("/:id/show", isLoggedIn, async (req, res) => {
  try {
    const prescription = await Prescription.findById(req.params.id);
    res.render("showpres", { pres: prescription });
  } catch (error) {
    console.log(error);
    res.render("error");
  }
});

module.exports = router;
