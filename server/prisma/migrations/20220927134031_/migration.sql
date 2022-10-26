/*
  Warnings:

  - Changed the type of `total` on the `tbl_detailTransaction` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "tbl_detailTransaction" DROP COLUMN "total",
ADD COLUMN     "total" INTEGER NOT NULL;
