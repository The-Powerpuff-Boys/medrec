const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");
const session = require("express-session");
const mongoose = require("mongoose");
const passport = require("passport");
const localStrategy = require("passport-local");
require("dotenv").config();

const Doctor = require("./models/doctor");

mongoose
  .connect("mongodb://localhost:27017/med-rec", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then((res) => {
    console.log("Database Connected");
  })
  .catch((err) => {
    console.log("Database Error");
    console.log(err);
  });

const port = process.env.PORT || 8080;
const sessionConfig = {
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false,
  cookie: {
    httpOnly: true,
    expires: Date.now() + 1000 * 60 * 60 * 24,
    maxAge: Date.now() + 1000 * 60 * 60 * 24,
  },
};

app.use(session(sessionConfig));
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));

app.use(passport.initialize());
app.use(passport.session());

passport.use(new localStrategy(Doctor.authenticate()));

passport.serializeUser(Doctor.serializeUser());
passport.deserializeUser(Doctor.deserializeUser());

app.use("/userinfo", require("./routes/doctor"));
app.use("/", require("./routes/user"));

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
