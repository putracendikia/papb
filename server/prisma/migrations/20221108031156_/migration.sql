/*
  Warnings:

  - You are about to drop the `AppliedVacany` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Vacany` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "AppliedVacany" DROP CONSTRAINT "AppliedVacany_userId_fkey";

-- DropForeignKey
ALTER TABLE "AppliedVacany" DROP CONSTRAINT "AppliedVacany_vacanyId_fkey";

-- DropForeignKey
ALTER TABLE "Vacany" DROP CONSTRAINT "Vacany_companyId_fkey";

-- DropTable
DROP TABLE "AppliedVacany";

-- DropTable
DROP TABLE "User";

-- DropTable
DROP TABLE "Vacany";

-- DropEnum
DROP TYPE "Status";
