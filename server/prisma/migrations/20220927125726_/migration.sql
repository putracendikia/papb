-- CreateEnum
CREATE TYPE "Status" AS ENUM ('User', 'Company');

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'COSTUMER');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "About" TEXT NOT NULL DEFAULT 'null',
    "Location" TEXT NOT NULL DEFAULT 'null',
    "Email" TEXT NOT NULL,
    "Phone" TEXT NOT NULL DEFAULT 'null',
    "Education" TEXT NOT NULL DEFAULT 'null',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "Field" TEXT NOT NULL DEFAULT 'null',
    "Employee" TEXT NOT NULL DEFAULT 'null',
    "Photo" TEXT NOT NULL DEFAULT 'null',
    "PhotoLandscape" TEXT NOT NULL DEFAULT 'null',
    "Password" TEXT NOT NULL,
    "Status" "Status" NOT NULL DEFAULT 'User',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vacany" (
    "id" TEXT NOT NULL,
    "VacanyName" TEXT NOT NULL,
    "DescVacany" TEXT NOT NULL,
    "ReqVacany" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "LstTimeToReg" TEXT NOT NULL DEFAULT 'null',
    "companyId" TEXT,

    CONSTRAINT "Vacany_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppliedVacany" (
    "id" TEXT NOT NULL,
    "Status" TEXT NOT NULL,
    "vacanyId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "AppliedVacany_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tbl_User" (
    "id" TEXT NOT NULL,
    "Username" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "noHp" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "Role" "Role" NOT NULL DEFAULT 'COSTUMER',

    CONSTRAINT "Tbl_User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbl_Menu" (
    "id" TEXT NOT NULL,
    "nameMenu" TEXT NOT NULL,
    "priceMenu" TEXT NOT NULL,
    "descMenu" TEXT NOT NULL,

    CONSTRAINT "tbl_Menu_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbl_detailTransaction" (
    "id" TEXT NOT NULL,
    "idTransaction" TEXT NOT NULL,
    "total" TEXT NOT NULL,
    "tbl_UserId" TEXT,

    CONSTRAINT "tbl_detailTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbl_detailOutlet" (
    "id" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "alamatOutlet" TEXT NOT NULL,
    "Status" TEXT NOT NULL,

    CONSTRAINT "tbl_detailOutlet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbl_Transaction" (
    "id" TEXT NOT NULL,
    "idUser" TEXT NOT NULL,
    "idOutlet" TEXT NOT NULL,
    "idMenu" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "payment" TEXT NOT NULL,
    "time" TIMESTAMP(3) NOT NULL,
    "promo" TEXT NOT NULL,

    CONSTRAINT "tbl_Transaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbl_log" (
    "id" TEXT NOT NULL,
    "jenisLog" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "idUser" TEXT NOT NULL,

    CONSTRAINT "tbl_log_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Tbl_User_email_key" ON "Tbl_User"("email");

-- AddForeignKey
ALTER TABLE "Vacany" ADD CONSTRAINT "Vacany_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppliedVacany" ADD CONSTRAINT "AppliedVacany_vacanyId_fkey" FOREIGN KEY ("vacanyId") REFERENCES "Vacany"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppliedVacany" ADD CONSTRAINT "AppliedVacany_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbl_detailTransaction" ADD CONSTRAINT "tbl_detailTransaction_idTransaction_fkey" FOREIGN KEY ("idTransaction") REFERENCES "tbl_Transaction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbl_detailTransaction" ADD CONSTRAINT "tbl_detailTransaction_tbl_UserId_fkey" FOREIGN KEY ("tbl_UserId") REFERENCES "Tbl_User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbl_detailOutlet" ADD CONSTRAINT "tbl_detailOutlet_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "Tbl_User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbl_Transaction" ADD CONSTRAINT "tbl_Transaction_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "Tbl_User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbl_Transaction" ADD CONSTRAINT "tbl_Transaction_idOutlet_fkey" FOREIGN KEY ("idOutlet") REFERENCES "tbl_detailOutlet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbl_Transaction" ADD CONSTRAINT "tbl_Transaction_idMenu_fkey" FOREIGN KEY ("idMenu") REFERENCES "tbl_Menu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
