const { Sequelize } = require("sequelize");

const sequelize = new Sequelize(process.env.DATABASE_URL);

async function connect() {
  try {
    await sequelize.authenticate();
    console.log("Hasbeen authenticated");
  } catch (err) {
    console.log(err);
  }
}

connect();
