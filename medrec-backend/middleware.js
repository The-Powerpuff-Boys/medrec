module.exports.isLoggedIn = (req, res, next) => {
  if (!req.isAuthenticated()) {
    return res.redirect("/login");
  }
  next();
};

module.exports.LoginPage = (req, res, next) => {
  if (req.isAuthenticated()) {
    return res.redirect("/home");
  }
  next();
};
