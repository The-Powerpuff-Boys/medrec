const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const { isLoggedIn } = require("../middleware");
const { route } = require("./user");

router.get("/new", (req, res) => {
  res.render("newdoctor");
});

router.post("/new", async (req, res) => {
  const { name, specialization, gender, p_no } = req.body;
  const newDoctor = await new Doctor({ name, specialization, gender, p_no });
  await newDoctor.save();
});

// router.get("/", async (req, res) => {
//   // const { _id } = req.user;
//   // console.log(_id);
//   res.redirect("doctorinfo");
// });

module.exports = router;
