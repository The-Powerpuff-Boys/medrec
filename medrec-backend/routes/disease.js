const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const Patient = require("../models/patient");
const Disease = require("../models/disease");
const { isLoggedIn } = require("../middleware");
const { route } = require("./user");

router.get("/new", (req, res) => {
  res.render("newdisease");
});

router.post("/new")

module.exports = router;
