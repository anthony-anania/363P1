CREATE TABLE `Entry_Removal`(
    `record_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `removal_date` DATE NOT NULL,
    `person_id` BIGINT NOT NULL,
    `item_id` BIGINT NOT NULL
);
ALTER TABLE
    `Entry_Removal` ADD INDEX `entry_removal_person_id_index`(`person_id`);
ALTER TABLE
    `Entry_Removal` ADD INDEX `entry_removal_item_id_index`(`item_id`);
CREATE TABLE `Item`(
    `item_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `item_name` VARCHAR(255) NOT NULL,
    `item_quantity` BIGINT NOT NULL,
    `column_4` BIGINT NOT NULL
);
CREATE TABLE `Person`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `date_of_birth` BIGINT NOT NULL
);
CREATE TABLE `Company`(
    `company_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `company_name` BIGINT NOT NULL
);
CREATE TABLE `Order_item`(
    `order_item_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `item_id` BIGINT NOT NULL,
    `unit_price` BIGINT NOT NULL,
    `order_id` BIGINT NOT NULL
);
ALTER TABLE
    `Order_item` ADD INDEX `order_item_order_id_index`(`order_id`);
CREATE TABLE `Customer`(
    `customer_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `person_id` BIGINT NOT NULL
);
CREATE TABLE `Admin`(
    `admin_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `person_id` BIGINT NOT NULL,
    `company_id` BIGINT NOT NULL
);
ALTER TABLE
    `Admin` ADD INDEX `admin_company_id_index`(`company_id`);
CREATE TABLE `Order`(
    `order_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date` DATE NOT NULL,
    `customer_id` BIGINT NOT NULL,
    `price` BIGINT NOT NULL
);
ALTER TABLE
    `Admin` ADD CONSTRAINT `admin_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `Person`(`id`);
ALTER TABLE
    `Customer` ADD CONSTRAINT `customer_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `Person`(`id`);
ALTER TABLE
    `Entry_Removal` ADD CONSTRAINT `entry_removal_item_id_foreign` FOREIGN KEY(`item_id`) REFERENCES `Item`(`item_id`);
ALTER TABLE
    `Order_item` ADD CONSTRAINT `order_item_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `Order`(`order_id`);
ALTER TABLE
    `Entry_Removal` ADD CONSTRAINT `entry_removal_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `Person`(`id`);
ALTER TABLE
    `Customer` ADD CONSTRAINT `customer_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Order`(`order_id`);
ALTER TABLE
    `Order_item` ADD CONSTRAINT `order_item_item_id_foreign` FOREIGN KEY(`item_id`) REFERENCES `Item`(`item_id`);
ALTER TABLE
    `Admin` ADD CONSTRAINT `admin_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `Company`(`company_id`);