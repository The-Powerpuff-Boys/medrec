const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const { isLoggedIn } = require("../middleware");
const { route } = require("./user");

router.post("/patientinfo", (req, res) => {
  res.send("pateint INfo");
});

module.exports = router;
