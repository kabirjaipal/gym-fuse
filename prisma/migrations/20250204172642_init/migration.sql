-- CreateTable
CREATE TABLE `m_diet` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` JSON NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `badge` VARCHAR(191) NOT NULL,
    `precautions` JSON NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_diet_benefits` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `icon` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `detail` VARCHAR(191) NOT NULL,
    `diet_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_diet_meal_plans` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `meal` VARCHAR(191) NOT NULL,
    `items` VARCHAR(191) NOT NULL,
    `calories` INTEGER NOT NULL,
    `time` VARCHAR(191) NOT NULL,
    `diet_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_diet_faq` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `diet_id` INTEGER NOT NULL,
    `question` VARCHAR(191) NOT NULL,
    `answer` VARCHAR(191) NOT NULL,
    `m_dietId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `m_gym` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `description` JSON NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `images` JSON NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `m_workout` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `difficulty` VARCHAR(191) NOT NULL,
    `duration` VARCHAR(191) NOT NULL,
    `frequency` VARCHAR(191) NOT NULL,
    `short_description` JSON NOT NULL,
    `long_description` JSON NOT NULL,
    `benefits` JSON NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_workout_plan` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workout_id` INTEGER NOT NULL,
    `title` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_exercise` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workout_plan_id` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `sets` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_tip` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workout_id` INTEGER NOT NULL,
    `content` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_additional_resource` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workout_id` INTEGER NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `icon` VARCHAR(191) NOT NULL,
    `url` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `t_diet_benefits` ADD CONSTRAINT `t_diet_benefits_diet_id_fkey` FOREIGN KEY (`diet_id`) REFERENCES `m_diet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `t_diet_meal_plans` ADD CONSTRAINT `t_diet_meal_plans_diet_id_fkey` FOREIGN KEY (`diet_id`) REFERENCES `m_diet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `t_diet_faq` ADD CONSTRAINT `t_diet_faq_m_dietId_fkey` FOREIGN KEY (`m_dietId`) REFERENCES `m_diet`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `t_workout_plan` ADD CONSTRAINT `t_workout_plan_workout_id_fkey` FOREIGN KEY (`workout_id`) REFERENCES `m_workout`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `t_exercise` ADD CONSTRAINT `t_exercise_workout_plan_id_fkey` FOREIGN KEY (`workout_plan_id`) REFERENCES `t_workout_plan`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `t_tip` ADD CONSTRAINT `t_tip_workout_id_fkey` FOREIGN KEY (`workout_id`) REFERENCES `m_workout`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `t_additional_resource` ADD CONSTRAINT `t_additional_resource_workout_id_fkey` FOREIGN KEY (`workout_id`) REFERENCES `m_workout`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
