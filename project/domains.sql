-- Ensuring item_quantity is non-negative
ALTER TABLE `Item`
ADD CONSTRAINT `chk_item_quantity_non_negative` CHECK (`item_quantity` >= 0);

-- Ensuring price is positive
ALTER TABLE `Order`
ADD CONSTRAINT `chk_order_price_positive` CHECK (`price` > 0);

-- Ensuring review_title is not empty
ALTER TABLE `Reviewers`
ADD CONSTRAINT `chk_review_title_not_empty` CHECK (CHAR_LENGTH(`review_title`) > 0);

-- Ensuring review_content is not empty
ALTER TABLE `Reviewers`
ADD CONSTRAINT `chk_review_content_not_empty` CHECK (CHAR_LENGTH(`review_content`) > 0);
