const jwt = require("jsonwebtoken");

//Web Token JWT
const maxAgeSession = 3 * 24 * 60 * 60;
exports.maxAgeSession = maxAgeSession;
const createWebToken = (id) => {
  return jwt.sign({ id }, process.env.SECRET_KEY, {
    expiresIn: maxAgeSession,
  });
};

exports.createWebToken = createWebToken;
