const { application } = require("express");
const express = require("express");
const passport = require("passport");
const { register } = require("../models/doctor");
const router = express.Router();
const Doctor = require("../models/doctor");
const { isLoggedIn } = require("../middleware");

router.get("/", (req, res) => {
  res.render("home", { visiters: "100M" });
});
/*












*/
// Login and Signup Routes
router.get("/signup", (req, res) => {
  res.render("signup");
});

router.post("/signup", async (req, res) => {
  try {
    const { email, password } = req.body;
    const username = email;
    const doctor = new Doctor({ username });
    const newDoctor = await Doctor.register(doctor, password);
    res.send(newDoctor);
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
    res.send("Logged in the user");
  }
);

router.get("/logout", (req, res) => {
  req.logout((err) => {
    if (err) {
      res.send("Error in Logging you out");
    }
    res.send("Logged out a user");
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
