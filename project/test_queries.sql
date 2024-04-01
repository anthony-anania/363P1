CREATE DATABASE Fakeit

Use Fakeit
-- CREATE TABLE `Entry_Removal`(
--     `record_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     `removal_date` DATE NOT NULL,
--     `person_id` BIGINT NOT NULL,
--     `item_id` BIGINT NOT NULL
-- );
-- ALTER TABLE
--     `Entry_Removal` ADD INDEX `entry_removal_person_id_index`(`person_id`);
-- ALTER TABLE
--     `Entry_Removal` ADD INDEX `entry_removal_item_id_index`(`item_id`);
-- CREATE TABLE `Item`(
--     `item_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     `item_name` VARCHAR(255) NOT NULL,
--     `item_quantity` BIGINT NOT NULL,
--     `column_4` BIGINT NOT NULL
-- );
-- CREATE TABLE `Person`(
--     `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     `name` BIGINT NOT NULL,
--     `date_of_birth` BIGINT NOT NULL
-- );
-- CREATE TABLE `Company`(
--     `company_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     `company_name` BIGINT NOT NULL
-- );
-- CREATE TABLE `Order_item`(
--     `order_item_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     `item_id` BIGINT NOT NULL,
--     `unit_price` BIGINT NOT NULL,
--     `order_id` BIGINT NOT NULL
-- );
-- ALTER TABLE
--     `Order_item` ADD INDEX `order_item_order_id_index`(`order_id`);
-- CREATE TABLE `Customer`(
--     `customer_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     `person_id` BIGINT NOT NULL
-- );
-- CREATE TABLE `Admin`(
--     `admin_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     `person_id` BIGINT NOT NULL,
--     `company_id` BIGINT NOT NULL
-- );
-- ALTER TABLE
--     `Admin` ADD INDEX `admin_company_id_index`(`company_id`);
-- CREATE TABLE `Order`(
--     `order_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     `date` DATE NOT NULL,
--     `customer_id` BIGINT NOT NULL,
--     `price` BIGINT NOT NULL
-- );
-- ALTER TABLE
--     `Admin` ADD CONSTRAINT `admin_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `Person`(`id`);
-- ALTER TABLE
--     `Customer` ADD CONSTRAINT `customer_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `Person`(`id`);
-- ALTER TABLE
--     `Entry_Removal` ADD CONSTRAINT `entry_removal_item_id_foreign` FOREIGN KEY(`item_id`) REFERENCES `Item`(`item_id`);
-- ALTER TABLE
--     `Order_item` ADD CONSTRAINT `order_item_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `Order`(`order_id`);
-- ALTER TABLE
--     `Entry_Removal` ADD CONSTRAINT `entry_removal_person_id_foreign` FOREIGN KEY(`person_id`) REFERENCES `Person`(`id`);
-- ALTER TABLE
--     `Customer` ADD CONSTRAINT `customer_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Order`(`order_id`);
-- ALTER TABLE
--     `Order_item` ADD CONSTRAINT `order_item_item_id_foreign` FOREIGN KEY(`item_id`) REFERENCES `Item`(`item_id`);
-- ALTER TABLE
--     `Admin` ADD CONSTRAINT `admin_company_id_foreign` FOREIGN KEY(`company_id`) REFERENCES `Company`(`company_id`);

CREATE TABLE orders (
    order_id INT PRIMARY KEY, user_id INT, eval_set VARCHAR(10), order_number INT, order_dow INT, order_hour_of_day INT, days_since_prior_order INT
);

CREATE TABLE aisle (
    aisle_id INT PRIMARY KEY, aisle VARCHAR(255) NOT NULL
);

CREATE TABLE order_products_train (
    order_id INT, product_id INT, add_to_cart_order INT, reordered INT, PRIMARY KEY (order_id, product_id), FOREIGN KEY (order_id) REFERENCES orders (order_id), FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE order_products_prior (
    order_id INT, product_id INT, add_to_cart_order INT, reordered INT, PRIMARY KEY (order_id, product_id), FOREIGN KEY (order_id) REFERENCES orders (order_id), FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY, product_name VARCHAR(255) NOT NULL, aisle_id INT, department_id INT, FOREIGN KEY (aisle_id) REFERENCES aisle (aisle_id), FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY, department VARCHAR(255) NOT NULL
);

-- Insert Code

-- Insert data into orders table
LOAD DATA LOCAL INFILE 'C:\Users\patel\Downloads\archive (4)/orders.csv' INTO
TABLE orders FIELDS TERMINATED BY '\t' ENCLOSED BY '' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insert data into aisle table
LOAD DATA INFILE 'C:\Users\patel\Downloads\archive (4)/aisle.csv' INTO
TABLE aisle FIELDS TERMINATED BY '\t' ENCLOSED BY '' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insert data into order_products_train table
LOAD DATA INFILE 'path/to/order_products_train.csv' INTO
TABLE order_products_train FIELDS TERMINATED BY '\t' ENCLOSED BY '' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insert data into order_products_prior table
LOAD DATA INFILE 'path/to/order_products_prior.csv' INTO
TABLE order_products_prior FIELDS TERMINATED BY '\t' ENCLOSED BY '' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insert data into products table
LOAD DATA INFILE 'path/to/products.csv' INTO
TABLE products FIELDS TERMINATED BY '\t' ENCLOSED BY '' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insert data into departments table
LOAD DATA INFILE 'path/to/departments.csv' INTO
TABLE departments FIELDS TERMINATED BY '\t' ENCLOSED BY '' LINES TERMINATED BY '\n' IGNORE 1 ROWS;