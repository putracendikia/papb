const express = require("express");
const bcrypt = require("bcrypt");
const { PrismaClient } = require("@prisma/client");
var bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
const prisma = new PrismaClient();
const { requireAuth } = require("./middleware/authMiddleware");
const cookieParser = require("cookie-parser");
require("dotenv").config();
const ngopeeeRouter = require("./controller/ngopeee");

const app = express();
const port = 3000;

//Web Token JWT
const maxAgeSession = 3 * 24 * 60 * 60;
const createWebToken = (id) => {
  return jwt.sign({ id }, process.env.SECRET_KEY, {
    expiresIn: maxAgeSession,
  });
};

app.use(bodyParser.json());
app.use(cookieParser());


app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET,PUT,PATCH,POST,DELETE");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

app.use("/api/ngopeee", ngopeeeRouter);
