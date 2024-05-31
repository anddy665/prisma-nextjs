/*
  Warnings:

  - The primary key for the `Coach` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `coachId` on the `Coach` table. All the data in the column will be lost.
  - The primary key for the `Course` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `courseId` on the `Course` table. All the data in the column will be lost.
  - The primary key for the `Schedule` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `scheduleId` on the `Schedule` table. All the data in the column will be lost.
  - The primary key for the `Topic` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `topicId` on the `Topic` table. All the data in the column will be lost.
  - Added the required column `id` to the `Coach` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Course` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Schedule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Topic` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `CoachTopic` DROP FOREIGN KEY `CoachTopic_coachId_fkey`;

-- DropForeignKey
ALTER TABLE `CoachTopic` DROP FOREIGN KEY `CoachTopic_topicId_fkey`;

-- DropForeignKey
ALTER TABLE `CoachTopicSchedule` DROP FOREIGN KEY `CoachTopicSchedule_coachId_fkey`;

-- DropForeignKey
ALTER TABLE `CoachTopicSchedule` DROP FOREIGN KEY `CoachTopicSchedule_scheduleId_fkey`;

-- DropForeignKey
ALTER TABLE `CoachTopicSchedule` DROP FOREIGN KEY `CoachTopicSchedule_topicId_fkey`;

-- DropForeignKey
ALTER TABLE `Schedule` DROP FOREIGN KEY `Schedule_coachId_fkey`;

-- DropForeignKey
ALTER TABLE `Schedule` DROP FOREIGN KEY `Schedule_topicId_fkey`;

-- DropForeignKey
ALTER TABLE `Topic` DROP FOREIGN KEY `Topic_courseId_fkey`;

-- AlterTable
ALTER TABLE `Coach` DROP PRIMARY KEY,
    DROP COLUMN `coachId`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Course` DROP PRIMARY KEY,
    DROP COLUMN `courseId`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Schedule` DROP PRIMARY KEY,
    DROP COLUMN `scheduleId`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Topic` DROP PRIMARY KEY,
    DROP COLUMN `topicId`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_coachId_fkey` FOREIGN KEY (`coachId`) REFERENCES `Coach`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_topicId_fkey` FOREIGN KEY (`topicId`) REFERENCES `Topic`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Topic` ADD CONSTRAINT `Topic_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopic` ADD CONSTRAINT `CoachTopic_coachId_fkey` FOREIGN KEY (`coachId`) REFERENCES `Coach`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopic` ADD CONSTRAINT `CoachTopic_topicId_fkey` FOREIGN KEY (`topicId`) REFERENCES `Topic`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_coachId_fkey` FOREIGN KEY (`coachId`) REFERENCES `Coach`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_topicId_fkey` FOREIGN KEY (`topicId`) REFERENCES `Topic`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_scheduleId_fkey` FOREIGN KEY (`scheduleId`) REFERENCES `Schedule`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
