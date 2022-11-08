const bcrypt = require("bcrypt");
const fetch = require('node-fetch');
const { PrismaClient } = require("@prisma/client");
const jwt = require("jsonwebtoken");
const bodyParser = require("body-parser");
const prisma = new PrismaClient();
const router = require("express").Router();

let midtransClient = require("midtrans-client");
const { urlencoded } = require("body-parser");

let core = new midtransClient.CoreApi({
  isProduction: false,
  serverKey: process.env.SERVER_KEY,
  clientKey: process.env.CLIENT_KEY,
});

const maxAgeSession = 3 * 24 * 60 * 60;
const createWebToken = (id) => {
  return jwt.sign({ id }, process.env.SECRET_KEY, {
    expiresIn: maxAgeSession,
  });
};

router.get("/", async (req, res) => {
  try {
    const getAllMenu = await prisma.tbl_Menu.findMany();
    return res.status(200).json({ getAllMenu });
  } catch (e) {
    console.log(e);
    return res.status(500).json({ message: e.message });
  }
});

router.get('/menu/:idMenu',bodyParser.urlencoded({extended : false}) ,async (req, res) => {
  const {idMenu} = req.params; 
  try {
    const data = await prisma.tbl_Menu.findFirst({
      where : {
        id : idMenu
      }
    })
    return res.status(200).json(data);
  } catch(err){
    return res.status(500).json({ message: err.message });
  }
})


router.post('/register',bodyParser.urlencoded({extended : false}),async (req,res)=> {
  const { Username, email, Password,noHp } = req.body;
    try {
      const verifyEmail = await prisma.tbl_User.findFirst({
        where: {
          email: email,
        },
      });
      if (verifyEmail) {
        return res.json("Email already exists");
      } else {
        let user = await prisma.tbl_User.create({
          data: {
            Username: Username,
            email: email,
            Password: bcrypt.hashSync(Password, 10),
            noHp : noHp
          },
        });
        return res.status(200).json({ user });
      }
    } catch (err) {
      console.log(err);
      return res.status(500);
    }
})

router.get('/profile/:id' , bodyParser.urlencoded({extended : false}) , async (req,res) => {
  const {id} = req.params
  try {
    const user = await prisma.tbl_User.findFirst({
      where : {
        id : id
      }
    })
    return res.status(200).json(user);
  } catch (error) {
    return res.status(500).send("User Tidak Ada")
  }
})

router.put('/profile/:id' , bodyParser.urlencoded({extended : false}) , async (req, res) => {
  const {id} = req.params
  const {nohp , email} = req.body
  try {
    const user = await prisma.tbl_User.update({
      where : {
        id : id
      },
      data : {
        noHp : nohp ? nohp : user.noHp,
        email : email ? email : user.email
      }
    })
    return res.status(200).send(user)
  } catch (err) {
    return res.status(500).send("Gagal merubah user")
  }
})

router.delete('/profile/:id' , bodyParser.urlencoded({extended : false}) , async (req, res) => {
  const {id} = req.params
  try {
    const user = await prisma.tbl_User.delete({
      where : {
        id : id
      },
    })
    return res.status(200).send("User Berhasil Dihapus")
  } catch (err) {
    return res.status(500).send("Gagal merubah user")
  }
})

router.post(
  "/login",
  bodyParser.urlencoded({ extended: false }),
  async (req, res) => {
    const { email, password } = req.body;
    try {
      const user = await prisma.tbl_User.findFirst({
        where: {
          email: email,
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
        res.status(200).send("Login Berhasil");
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

router.get('/transaction/status' , async (req, res) => {
  try {
    core.transaction.status("test-GOPAY-135").then((response) => {
      return res.status(200).json(response)
    })
  } catch (error) {
    console.log(error)
  }
})

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

router.post('/transaction/checkout', bodyParser.urlencoded({extended : false}),async(req,res) =>{
  const {totalPrice , payment } = req.body
  let parameter = {
    payment_type:  payment,
    transaction_details: {
      gross_amount: totalPrice,
      order_id: `test-${payment}-${Math.round(Math.random()* 1000)}`,
    },
    gopay: {
      enable_callback: true, // optional
      callback_url: "someapps://callback", // optional
    },
  };
  try {
    core.charge(parameter).then((chargeResponse) => {
      const data = {
        "Order ID": chargeResponse.order_id,
        "Transaction ID": chargeResponse.transaction_id,
        "Gross Amount": chargeResponse.gross_amount,
        "Curreny Type": chargeResponse.curreny,
        "Payment Type ": chargeResponse.payment_type,
        "Transaction Time ": chargeResponse.transaction_time,
        "Transaction Status ": chargeResponse.transaction_status,
        "Action ": chargeResponse.action,
      };
      res.json({ chargeResponse });
    });
  } catch (err) {
    console.log(err)
    return res.status(500).send("GAGAL")
  }
})
module.exports = router;
