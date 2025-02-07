/*
  Warnings:

  - You are about to drop the column `m_dietId` on the `t_diet_faq` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `t_diet_faq` DROP FOREIGN KEY `t_diet_faq_m_dietId_fkey`;

-- DropIndex
DROP INDEX `t_diet_faq_m_dietId_fkey` ON `t_diet_faq`;

-- AlterTable
ALTER TABLE `t_diet_faq` DROP COLUMN `m_dietId`;

-- AddForeignKey
ALTER TABLE `t_diet_faq` ADD CONSTRAINT `t_diet_faq_diet_id_fkey` FOREIGN KEY (`diet_id`) REFERENCES `m_diet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
