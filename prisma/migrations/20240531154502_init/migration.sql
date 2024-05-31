-- CreateTable
CREATE TABLE `Coach` (
    `coach_id` INTEGER NOT NULL AUTO_INCREMENT,
    `coach_name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(255) NULL,
    `phone_number` VARCHAR(20) NULL,

    PRIMARY KEY (`coach_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Course` (
    `course_id` INTEGER NOT NULL AUTO_INCREMENT,
    `course_name` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `start_date` DATE NULL,
    `end_date` DATE NULL,

    PRIMARY KEY (`course_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Schedule` (
    `schedule_id` INTEGER NOT NULL AUTO_INCREMENT,
    `coach_id` INTEGER NULL,
    `topic_id` INTEGER NULL,
    `schedule_time` TIME NULL,
    `schedule_day` VARCHAR(20) NULL,
    `schedule_location` VARCHAR(255) NULL,

    PRIMARY KEY (`schedule_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Topic` (
    `topic_id` INTEGER NOT NULL AUTO_INCREMENT,
    `topic_name` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `duration` INTEGER NULL,
    `course_id` INTEGER NULL,

    PRIMARY KEY (`topic_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CoachTopic` (
    `coach_id` INTEGER NOT NULL,
    `topic_id` INTEGER NOT NULL,

    PRIMARY KEY (`coach_id`, `topic_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CoachTopicSchedule` (
    `coach_id` INTEGER NOT NULL,
    `topic_id` INTEGER NOT NULL,
    `schedule_id` INTEGER NOT NULL,

    PRIMARY KEY (`coach_id`, `topic_id`, `schedule_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_coach_id_fkey` FOREIGN KEY (`coach_id`) REFERENCES `Coach`(`coach_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_topic_id_fkey` FOREIGN KEY (`topic_id`) REFERENCES `Topic`(`topic_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Topic` ADD CONSTRAINT `Topic_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `Course`(`course_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopic` ADD CONSTRAINT `CoachTopic_coach_id_fkey` FOREIGN KEY (`coach_id`) REFERENCES `Coach`(`coach_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopic` ADD CONSTRAINT `CoachTopic_topic_id_fkey` FOREIGN KEY (`topic_id`) REFERENCES `Topic`(`topic_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_coach_id_fkey` FOREIGN KEY (`coach_id`) REFERENCES `Coach`(`coach_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_topic_id_fkey` FOREIGN KEY (`topic_id`) REFERENCES `Topic`(`topic_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CoachTopicSchedule` ADD CONSTRAINT `CoachTopicSchedule_schedule_id_fkey` FOREIGN KEY (`schedule_id`) REFERENCES `Schedule`(`schedule_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
