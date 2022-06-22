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

router.get("/:id", async (req, res) => {
  const abha = req.params.abha;
  const disease = await Disease.findById(req.params.id).populate(
    "prescriptions"
  );
  res.render("presindex", { abha, disease });
});

router.get("/:id/new", (req, res) => {
  const diseaseId = req.params.id;
  res.render("newpres", { diseaseId });
});

router.post("/:id/new", async (req, res) => {
  const { date, testreport, patientdesc, doctordesc, medicines } = req.body;
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
});

router.get("/:id/show", async (req, res) => {
  const prescription = await Prescription.findById(req.params.id);
  res.render("showpres", { pres: prescription });
});

module.exports = router;
