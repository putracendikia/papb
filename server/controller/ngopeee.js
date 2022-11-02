const bcrypt = require("bcrypt");
const { PrismaClient } = require("@prisma/client");
const jwt = require("jsonwebtoken");
const bodyParser = require("body-parser");
const { appendFile } = require("fs");
const prisma = new PrismaClient();
const router = require("express").Router();

// const getMenu = async (req, res) => {
//   try {
//     const getAllMenu = await prisma.tbl_Menu.findMany();
//     return res.status(200).json({ getAllMenu });
//   } catch (e) {
//     console.log(e);
//     return res.status(500).json({ message: e.message });
//   }
// };

router.get("/", async (req, res) => {
  const getAllMenu = await prisma.tbl_Menu.findMany();
  return res.status(200).json({ getAllMenu });
});
router.post(
  "/login",
  bodyParser.urlencoded({ extended: false }),
  async (req, res) => {
    const { email, password } = req.body;
    try {
      const user = await prisma.User.findFirst({
        where: {
          Email: email,
        },
      });
      if (!user) {
        throw new Error("Invalid Login");
      }
      const validate = await bcrypt.compare(password, user.Password);
      if (!validate) {
        throw new Error("Invalid Password");
      } else {
        const token = createWebToken(user.id);
        res.cookie("jwt", token, {
          httpOnly: true,
          maxAge: maxAgeSession * 1000,
        });
        res.send("Login successful");
      }
    } catch (err) {
      console.log(err);
      return res.status(500);
    }
  }
);

router.get("/logout", (req, res) => {
    res.cookie("jwt", "", { maxAge: 1 });
    res.redirect("/");
  });

router.get("/Keranjang", async (req, res, next) => {
    try {
      const getMenu = await prisma.tbl_Menu.findMany({
        where: {
          id: { in: ["cl80eygx2025964cl6udwcstr", "cl80df451015864clorkgcdap"] },
        },
        select: {
          nameMenu: true,
          priceMenu: true,
        },
      });
      const totalPrize = getMenu.reduce((acc, curVal) => {
        return acc + parseInt(curVal.priceMenu);
      }, 0);
      return res.status(200).json({ getMenu, totalPrize });
    } catch (error) {
      console.log(error);
      return res.status(500);
    }
  });
module.exports = router;
