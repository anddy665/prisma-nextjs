/*
  Warnings:

  - The primary key for the `Coach` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `coach_id` on the `Coach` table. All the data in the column will be lost.
  - You are about to drop the column `coach_name` on the `Coach` table. All the data in the column will be lost.
  - You are about to drop the column `phone_number` on the `Coach` table. All the data in the column will be lost.
  - The primary key for the `CoachTopic` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `coach_id` on the `CoachTopic` table. All the data in the column will be lost.
  - You are about to drop the column `topic_id` on the `CoachTopic` table. All the data in the column will be lost.
  - The primary key for the `CoachTopicSchedule` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `coach_id` on the `CoachTopicSchedule` table. All the data in the column will be lost.
  - You are about to drop the column `schedule_id` on the `CoachTopicSchedule` table. All the data in the column will be lost.
  - You are about to drop the column `topic_id` on the `CoachTopicSchedule` table. All the data in the column will be lost.
  - The primary key for the `Course` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `course_id` on the `Course` table. All the data in the column will be lost.
  - You are about to drop the column `course_name` on the `Course` table. All the data in the column will be lost.
  - You are about to drop the column `end_date` on the `Course` table. All the data in the column will be lost.
  - You are about to drop the column `start_date` on the `Course` table. All the data in the column will be lost.
  - The primary key for the `Schedule` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `coach_id` on the `Schedule` table. All the data in the column will be lost.
  - You are about to drop the column `schedule_day` on the `Schedule` table. All the data in the column will be lost.
  - You are about to drop the column `schedule_id` on the `Schedule` table. All the data in the column will be lost.
  - You are about to drop the column `schedule_location` on the `Schedule` table. All the data in the column will be lost.
  - You are about to drop the column `schedule_time` on the `Schedule` table. All the data in the column will be lost.
  - You are about to drop the column `topic_id` on the `Schedule` table. All the data in the column will be lost.
  - The primary key for the `Topic` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `course_id` on the `Topic` table. All the data in the column will be lost.
  - You are about to drop the column `topic_id` on the `Topic` table. All the data in the column will be lost.
  - You are about to drop the column `topic_name` on the `Topic` table. All the data in the column will be lost.
  - Added the required column `coachId` to the `Coach` table without a default value. This is not possible if the table is not empty.
  - Added the required column `coachName` to the `Coach` table without a default value. This is not possible if the table is not empty.
  - Added the required column `coachId` to the `CoachTopic` table without a default value. This is not possible if the table is not empty.
  - Added the required column `topicId` to the `CoachTopic` table without a default value. This is not possible if the table is not empty.
  - Added the required column `coachId` to the `CoachTopicSchedule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `scheduleId` to the `CoachTopicSchedule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `topicId` to the `CoachTopicSchedule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `courseId` to the `Course` table without a default value. This is not possible if the table is not empty.
  - Added the required column `courseName` to the `Course` table without a default value. This is not possible if the table is not empty.
  - Added the required column `scheduleId` to the `Schedule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `topicId` to the `Topic` table without a default value. This is not possible if the table is not empty.
  - Added the required column `topicName` to the `Topic` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `CoachTopic` DROP FOREIGN KEY `CoachTopic_coach_id_fkey`;

-- DropForeignKey
ALTER TABLE `CoachTopic` DROP FOREIGN KEY `CoachTopic_topic_id_fkey`;

-- DropForeignKey
ALTER TABLE `CoachTopicSchedule` DROP FOREIGN KEY `CoachTopicSchedule_coach_id_fkey`;

-- DropForeignKey
ALTER TABLE `CoachTopicSchedule` DROP FOREIGN KEY `CoachTopicSchedule_schedule_id_fkey`;

-- DropForeignKey
ALTER TABLE `CoachTopicSchedule` DROP FOREIGN KEY `CoachTopicSchedule_topic_id_fkey`;

-- DropForeignKey
ALTER TABLE `Schedule` DROP FOREIGN KEY `Schedule_coach_id_fkey`;

-- DropForeignKey
ALTER TABLE `Schedule` DROP FOREIGN KEY `Schedule_topic_id_fkey`;

-- DropForeignKey
ALTER TABLE `Topic` DROP FOREIGN KEY `Topic_course_id_fkey`;

-- AlterTable
ALTER TABLE `Coach` DROP PRIMARY KEY,
    DROP COLUMN `coach_id`,
    DROP COLUMN `coach_name`,
    DROP COLUMN `phone_number`,
    ADD COLUMN `coachId` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `coachName` VARCHAR(191) NOT NULL,
    ADD COLUMN `phoneNumber` VARCHAR(20) NULL,
    ADD PRIMARY KEY (`coachId`);

-- AlterTable
ALTER TABLE `CoachTopic` DROP PRIMARY KEY,
    DROP COLUMN `coach_id`,
    DROP COLUMN `topic_id`,
    ADD COLUMN `coachId` INTEGER NOT NULL,
    ADD COLUMN `topicId` INTEGER NOT NULL,
    ADD PRIMARY KEY (`coachId`, `topicId`);

-- AlterTable
ALTER TABLE `CoachTopicSchedule` DROP PRIMARY KEY,
    DROP COLUMN `coach_id`,
    DROP COLUMN `schedule_id`,
    DROP COLUMN `topic_id`,
    ADD COLUMN `coachId` INTEGER NOT NULL,
    ADD COLUMN `scheduleId` INTEGER NOT NULL,
    ADD COLUMN `topicId` INTEGER NOT NULL,
    ADD PRIMARY KEY (`coachId`, `topicId`, `scheduleId`);

-- AlterTable
ALTER TABLE `Course` DROP PRIMARY KEY,
    DROP COLUMN `course_id`,
    DROP COLUMN `course_name`,
    DROP COLUMN `end_date`,
    DROP COLUMN `start_date`,
    ADD COLUMN `courseId` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `courseName` VARCHAR(191) NOT NULL,
    ADD COLUMN `endDate` DATE NULL,
    ADD COLUMN `startDate` DATE NULL,
    ADD PRIMARY KEY (`courseId`);

-- AlterTable
ALTER TABLE `Schedule` DROP PRIMARY KEY,
    DROP COLUMN `coach_id`,
    DROP COLUMN `schedule_day`,
    DROP COLUMN `schedule_id`,
    DROP COLUMN `schedule_location`,
    DROP COLUMN `schedule_time`,
    DROP COLUMN `topic_id`,
    ADD COLUMN `coachId` INTEGER NULL,
    ADD COLUMN `scheduleDay` VARCHAR(20) NULL,
    ADD COLUMN `scheduleId` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `scheduleLocation` VARCHAR(255) NULL,
    ADD COLUMN `scheduleTime` TIME NULL,
    ADD COLUMN `topicId` INTEGER NULL,
    ADD PRIMARY KEY (`scheduleId`);

-- AlterTable
ALTER TABLE `Topic` DROP PRIMARY KEY,
    DROP COLUMN `course_id`,
    DROP COLUMN `topic_id`,
    DROP COLUMN `topic_name`,
    ADD COLUMN `courseId` INTEGER NULL,
    ADD COLUMN `topicId` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `topicName` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`topicId`);

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_coachId_fkey` FOREIGN KEY (`coachId`) REFERENCES `Coach`(`coachId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_topicId_fkey` FOREIGN KEY (`topicId`) REFERENCES `Topic`(`topicId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Topic` ADD CONSTRAINT `Topic_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`courseId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopic` ADD CONSTRAINT `CoachTopic_coachId_fkey` FOREIGN KEY (`coachId`) REFERENCES `Coach`(`coachId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopic` ADD CONSTRAINT `CoachTopic_topicId_fkey` FOREIGN KEY (`topicId`) REFERENCES `Topic`(`topicId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_coachId_fkey` FOREIGN KEY (`coachId`) REFERENCES `Coach`(`coachId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_topicId_fkey` FOREIGN KEY (`topicId`) REFERENCES `Topic`(`topicId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_scheduleId_fkey` FOREIGN KEY (`scheduleId`) REFERENCES `Schedule`(`scheduleId`) ON DELETE RESTRICT ON UPDATE CASCADE;
