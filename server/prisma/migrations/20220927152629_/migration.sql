/*
  Warnings:

  - You are about to drop the `Tbl_User` table. If the table is not empty, all the data it contains will be lost.
  - Changed the type of `priceMenu` on the `tbl_Menu` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "tbl_Transaction" DROP CONSTRAINT "tbl_Transaction_idUser_fkey";

-- DropForeignKey
ALTER TABLE "tbl_detailOutlet" DROP CONSTRAINT "tbl_detailOutlet_idUser_fkey";

-- DropForeignKey
ALTER TABLE "tbl_detailTransaction" DROP CONSTRAINT "tbl_detailTransaction_tbl_UserId_fkey";

-- AlterTable
ALTER TABLE "tbl_Menu" DROP COLUMN "priceMenu",
ADD COLUMN     "priceMenu" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Tbl_User";

-- CreateTable
CREATE TABLE "tbl_User" (
    "id" TEXT NOT NULL,
    "Username" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "noHp" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "Role" "Role" NOT NULL DEFAULT 'COSTUMER',

    CONSTRAINT "tbl_User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "tbl_User_email_key" ON "tbl_User"("email");

-- AddForeignKey
ALTER TABLE "tbl_detailTransaction" ADD CONSTRAINT "tbl_detailTransaction_tbl_UserId_fkey" FOREIGN KEY ("tbl_UserId") REFERENCES "tbl_User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbl_detailOutlet" ADD CONSTRAINT "tbl_detailOutlet_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "tbl_User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tbl_Transaction" ADD CONSTRAINT "tbl_Transaction_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "tbl_User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
