const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const { isLoggedIn, LoginPage } = require("../middleware");

router.get("/", async (req, res) => {
  res.render("landing", { user: req.user });
});

router.get("/home", isLoggedIn, async (req, res) => {
  res.render("home");
});

router.get("/userinfo", isLoggedIn, async (req, res) => {
  try {
    const { _id } = req.user;
    const doctor = await Doctor.findById({ _id });
    res.render("doctorinfo", {
      email: doctor.email,
      specialization: doctor.specialization,
      gender: doctor.gender,
      p_no: doctor.p_no,
    });
  } catch (error) {
    console.log(error);
    res.render("error");
  }
});

router.get("/signup", LoginPage, (req, res) => {
  res.render("signup");
});

router.post("/signup", async (req, res) => {
  try {
    const {
      email,
      fname,
      username,
      password,
      name,
      specialization,
      gender,
      p_no,
    } = req.body;
    const doctor = new Doctor({
      username,
      fname,
      email,
      name,
      specialization,
      gender,
      p_no,
    });
    const newDoctor = await Doctor.register(doctor, password);
    res.render("successsignup");
  } catch (error) {
    console.log(error);
    res.render("error");
  }
});

router.get("/login", LoginPage, (req, res) => {
  res.render("login");
});

router.post(
  "/login",
  passport.authenticate("local", {
    failureMessage: true,
    failureRedirect: "/login",
  }),
  (req, res) => {
    res.redirect("/home");
  }
);

router.get("/logout", isLoggedIn, (req, res) => {
  req.logout((err) => {
    if (err) {
      res.send("Error in Logging you out");
    }
    res.redirect("/login");
  });
});

router.get("/yo", (req, res) => {
  res.send(req);
});

module.exports = router;
