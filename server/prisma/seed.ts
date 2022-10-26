// app/prisma/seed.ts
import { PrismaClient, tbl_Menu, tbl_User } from "@prisma/client";
import { faker } from "@faker-js/faker";

const prisma = new PrismaClient();

async function main() {
  const amountOfUsers = 20;

  const users: tbl_User[] = [];

  for (let i = 0; i < amountOfUsers; i++) {
    const user: tbl_User = {
      id: faker.random.alphaNumeric(10),
      Role: faker.helpers.arrayElement(["COSTUMER", "ADMIN"]),
      Username: faker.internet.userName(),
      email: faker.internet.email(),
      noHp: faker.phone.number("08#########"),
      Password: faker.internet.password(),
    };

    users.push(user);
  }

  const amountOfMenu = 20;
  const BunchOfMenu: tbl_Menu[] = [];

  for (let i = 0; i < amountOfMenu; i++) {
    const menu: tbl_Menu = {
      id: faker.random.alphaNumeric(10),
      nameMenu: faker.internet.userName(),
      priceMenu: faker.datatype.number({ min: 20000 }),
      descMenu: faker.lorem.paragraph(),
    };
    BunchOfMenu.push(menu);
  }

  const addUsers = async () =>
    await prisma.tbl_User.createMany({ data: users });
  await prisma.tbl_Menu.createMany({ data: BunchOfMenu });

  addUsers();
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
