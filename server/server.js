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

let midtransClient = require("midtrans-client");

let core = new midtransClient.CoreApi({
  isProduction: false,
  serverKey: process.env.SERVER_KEY,
  clientKey: process.env.CLIENT_KEY,
});

let parameter = {
  payment_type: "gopay",
  transaction_details: {
    gross_amount: 121435,
    order_id: "test-transaction-214214",
  },
  gopay: {
    enable_callback: true, // optional
    callback_url: "someapps://callback", // optional
  },
};

app.use("/api/ngopeee", ngopeeeRouter);

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

app.get("/Menu", async (req, res, next) => {
  try {
    const getAllMenu = await prisma.tbl_Menu.findMany();
    return res.status(200).json({ getAllMenu });
  } catch (error) {
    console.log(error);
    return res.status(500);
  }
});

app.use("/api/ngopee/keranjang",ngopeeeRouter)

// app.get("/Keranjang", async (req, res, next) => {
//   try {
//     const getMenu = await prisma.tbl_Menu.findMany({
//       where: {
//         id: { in: ["cl80eygx2025964cl6udwcstr", "cl80df451015864clorkgcdap"] },
//       },
//       select: {
//         nameMenu: true,
//         priceMenu: true,
//       },
//     });
//     const totalPrize = getMenu.reduce((acc, curVal) => {
//       return acc + parseInt(curVal.priceMenu);
//     }, 0);
//     return res.status(200).json({ getMenu, totalPrize });
//   } catch (error) {
//     console.log(error);
//     return res.status(500);
//   }
// });

app.post("/gopay", (req, res, next) => {
  try {
  } catch (err) {}
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
    // const transaction = await prisma.tbl_Transaction.create({
    //   data: {
    //     idUser: "cl80cskzx0054i0clkjub11no",
    //     idOutlet: "cl80ddhfj011964cl0pthdtoy",
    //     idMenu: "cl80df451015864clorkgcdap",
    //     status: chargeResponse.transaction_status,
    //     payment: chargeResponse.payment_type,
    //     time: chargeResponse.transaction_time,
    //     promo: "Pake Poromo",
    //   },
    // });
    res.json({ chargeResponse });
  });
});

app.get("/charge/pay", (req, res, next) => {});

app.post(
  "/register",
  bodyParser.urlencoded({ extended: false }),

  async (req, res, next) => {
    const { name, email, password } = req.body;
    try {
      const verifyEmail = await prisma.User.findFirst({
        where: {
          Email: email,
        },
      });
      if (verifyEmail) {
        return res.json("Email already exists");
      } else {
        // prisma.$use(async (params, next) => {
        //   // Manipulate params here
        //   const result = await next(params);
        //   const log = await prisma.tbl_log.create({
        //     data: {
        //       jenisLog: "Register Akun",
        //       idUser: result.id,
        //       created_at: result.created_at,
        //     },
        //   });
        //   // See results here
        //   return res.status(201).json({ result, log });
        // });
        let user = await prisma.User.create({
          data: {
            name: name,
            Email: email,
            Password: bcrypt.hashSync(password, 10),
          },
        });
        const token = createWebToken(user.id);
        res.cookie("jwt", token, {
          httpOnly: true,
          maxAge: maxAgeSession * 1000,
        });
        return res.status(201).json({ user: user.id });
      }
    } catch (err) {
      console.log(err);
      return res.status(500);
    }
  }
);

//DONE : Applied Session For User
app.post(
  "/login",
  bodyParser.urlencoded({ extended: false }),
  async (req, res, next) => {
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

app.get("/logout", (req, res) => {
  res.cookie("jwt", "", { maxAge: 1 });
  res.redirect("/");
});

// app.post(
//   "/RegisterVacany",
//   bodyParser.urlencoded({ extended: false }),
//   async (req, res) => {
//     const { vacanyName, descVacany, reqVacany, companyId } = req.body;
//     try {
//       const user = await prisma.User.findFirst({
//         where: {
//           id: companyId,
//         },
//       });
//       if (user.Status == "Company") {
//         const Vacany = await prisma.Vacany.create({
//           data: {
//             VacanyName: vacanyName,
//             DescVacany: descVacany,
//             ReqVacany: reqVacany,
//             companyId: user.id,
//           },
//         });
//         return res.status(201).json({ vacanId: Vacany.id });
//       } else {
//         console.log("User is not Company");
//       }
//     } catch (err) {
//       console.log(err);
//       return res.status(500);
//     }
//   }
// );
// app.get("/ListVacany", requireAuth, async (req, res, next) => {
//   try {
//     const getAllVacany = await prisma.Vacany.findMany();
//     return res.status(200).json({ getAllVacany });
//   } catch (err) {
//     console.log(err);
//     return res.status(500);
//   }
// });

// app.get("/ListVacany/:id", requireAuth, async (req, res, next) => {
//   const { id } = req.params;
//   try {
//     const Vacany = await prisma.Vacany.findFirst({
//       where: {
//         id: id,
//       },
//       select: {
//         VacanyName: true,
//         DescVacany: true,
//         ReqVacany: true,
//       },
//     });
//     res.status(200).json({ Vacany });
//   } catch (err) {
//     console.log(err);
//     return res.status(500);
//   }

//   console.log(id);
// }); //Spesific Vacany

// app.post(
//   "/ListVacany/:idVacany/:idUser/Applied",
//   requireAuth,
//   async (req, res, next) => {
//     const { idVacany, idUser } = req.params;
//     try {
//       const CreateAppliedVacany = await prisma.AppliedVacany.create({
//         data: {
//           Status: "Pending",
//           vacanyId: idVacany,
//           userId: idUser,
//         },
//       });
//       return res.status(200).json(CreateAppliedVacany);
//     } catch (err) {
//       console.log(err);
//       return res.status(500);
//     }
//   }
// );

app.post(
  "/ngopeee/register",
  bodyParser.urlencoded({ extended: false }),
  async (req, res, next) => {
    const { Username, noHp, password, email } = req.body;
    try {
      const verifyEmail = await prisma.tbl_User.findFirst({
        where: {
          OR: [{ noHp: noHp }, { email: email }],
        },
      });
      if (verifyEmail) {
        return res.json("Number or Email already exists");
      } else {
        // prisma.$use(async (params, next) => {
        //   // Manipulate params here
        //   const result = await next(params);
        //   const log = await prisma.tbl_log.create({
        //     data: {
        //       jenisLog: "Register Akun",
        //       idUser: result.id,
        //       created_at: result.created_at,
        //     },
        //   });
        //   // See results here
        //   return res.status(201).json({ result, log });
        // });
        let user = await prisma.tbl_User.create({
          data: {
            Username: Username,
            email: email,
            noHp: noHp,
            Password: bcrypt.hashSync(password, 10),
          },
        });
        const token = createWebToken(user.id);
        res.cookie("jwt", token, {
          httpOnly: true,
          maxAge: maxAgeSession * 1000,
        });
        return res.status(201).json({ user: user.id });
      }
    } catch (err) {
      console.log(err);
      return res.status(500);
    }
  }
);

app.get("/ngopeee/logout", (req, res) => {
  res.cookie("jwt", "", { maxAge: 1 });
  res.redirect("/");
});

app.post(
  "/ngopeee/transaction",
  bodyParser.urlencoded({ extended: false }),
  async (req, res) => {
    const { idMenu, promo, statuspesan } = req.body;
    try {
      const transaction = await prisma.tbl_Transaction.findFirst({
        where: {
          id: "cl8kd0zhe0002zscl4clgbg6u",
          status: "PENDING",
        },
      });
      if (transaction) {
        return res.json("Silahkan Lakukan Pembayaran"); //Dialihkan ke page pembayaran langsung
      } else {
        const date = "2022-01-13 12:00:00";
        const transaction = await prisma.tbl_Transaction.create({
          data: {
            idUser: "7q8qmpsnto",
            idOutlet: "1",
            idMenu: idMenu,
            status: "PENDING",
            payment: "GOPAY",
            promo: promo,
          },
        });
        return res.status(201).json({
          transaction: transaction,
        });
      }
    } catch (error) {
      console.log(error);
      return res.status(500);
    }
  }
);

app.get("/ngopeee/detailTransaction/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const transactions = await prisma.tbl_Transaction.findMany({
      where: {
        idUser: id,
      },
      include: {
        tbl_Menu: {
          select: {
            priceMenu: true,
          },
        },
      },
    });
    if (transactions) {
      transactions.map((x) => console.log(x.idMenu));
      res.status(200).json(transactions);
    } else {
      res.json("Tidak ada pesanan");
    }
  } catch (error) {
    console.log(error);
    return res.status(500);
  }
});

app.get("/ngopeee/dashboard", async (req, res) => {
  try {
    const menu = await prisma.tbl_Menu.findMany();
    return res.status(200).json(menu);
  } catch (error) {
    console.log(error);
    return res.status(500);
  }
});
