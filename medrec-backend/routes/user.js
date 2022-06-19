const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const { isLoggedIn } = require("../middleware");

router.get("/", async (req, res) => {
  const { _id } = req.user;
  const doctor = await Doctor.findById({ _id });
  res.render("home", { username: doctor.username });
});
/*












*/
// Login and Signup Routes
router.get("/signup", (req, res) => {
  res.render("signup");
});

router.post("/signup", async (req, res) => {
  try {
    const { email, username, password, name, specialization, gender, p_no } =
      req.body;
    const doctor = new Doctor({
      username,
      email,
      name,
      specialization,
      gender,
      p_no,
    });
    const newDoctor = await Doctor.register(doctor, password);
    res.redirect("successsignup");
  } catch (error) {
    res.send("Error Occured while making a new user");
    console.log(error);
  }
});

router.get("/login", (req, res) => {
  res.render("login");
});

router.post(
  "/login",
  passport.authenticate("local", {
    failureMessage: true,
    failureRedirect: "/login",
  }),
  (req, res) => {
    res.redirect("/");
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
/*















*/
// Doctor Info Route
// router.post("/user/new");

// router.get("/userinfo", isLoggedIn, (req, res) => {
//   res.send("Getting the user");
// });
/*


















*/
// Patient Info Route

module.exports = router;
