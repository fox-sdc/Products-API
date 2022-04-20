-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'products'
--
-- ---

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `slogan` VARCHAR(255) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `category` VARCHAR(255) NULL DEFAULT NULL,
  `default_price` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'styles'
--
-- ---

DROP TABLE IF EXISTS `styles`;

CREATE TABLE `styles` (
  `product_id` INTEGER NULL DEFAULT NULL,
  `style_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `original_price` VARCHAR(255) NULL DEFAULT NULL,
  `sale_price` VARCHAR(255) NULL DEFAULT NULL,
  `default?` VARCHAR(255) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`style_id`)
);

-- ---
-- Table 'photos'
--
-- ---

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `style_id` INTEGER NULL DEFAULT NULL,
  `photo_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `thumbnail_url` VARCHAR(1000) NULL DEFAULT NULL,
  `url` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
);

-- ---
-- Table 'skus'
--
-- ---

DROP TABLE IF EXISTS `skus`;

CREATE TABLE `skus` (
  `style_id` INTEGER NULL DEFAULT NULL,
  `sku_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `quantity` INTEGER NULL DEFAULT NULL,
  `size` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`sku_id`)
);

-- ---
-- Table 'features'
--
-- ---

DROP TABLE IF EXISTS `features`;

CREATE TABLE `features` (
  `product_id` INTEGER NULL DEFAULT NULL,
  `feature_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `feature` VARCHAR(255) NULL DEFAULT NULL,
  `value` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`feature_id`)
);

-- ---
-- Table 'realted_products'
--
-- ---

DROP TABLE IF EXISTS `realted_products`;

CREATE TABLE `realted_products` (
  `product_id` INTEGER NULL DEFAULT NULL,
  `related_product_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`related_product_id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `styles` ADD FOREIGN KEY (product_id) REFERENCES `products` (`id`);
ALTER TABLE `photos` ADD FOREIGN KEY (style_id) REFERENCES `styles` (`style_id`);
ALTER TABLE `skus` ADD FOREIGN KEY (style_id) REFERENCES `styles` (`style_id`);
ALTER TABLE `features` ADD FOREIGN KEY (product_id) REFERENCES `products` (`id`);
ALTER TABLE `realted_products` ADD FOREIGN KEY (product_id) REFERENCES `products` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `realted_products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `products` (`id`,`name`,`slogan`,`description`,`category`,`default_price`) VALUES
-- ('','','','','','');
-- INSERT INTO `styles` (`product_id`,`style_id`,`name`,`original_price`,`sale_price`,`default?`) VALUES
-- ('','','','','','');
-- INSERT INTO `photos` (`style_id`,`photo_id`,`thumbnail_url`,`url`) VALUES
-- ('','','','');
-- INSERT INTO `skus` (`style_id`,`sku_id`,`quantity`,`size`) VALUES
-- ('','','','');
-- INSERT INTO `features` (`product_id`,`feature_id`,`feature`,`value`) VALUES
-- ('','','','');
-- INSERT INTO `realted_products` (`product_id`,`related_product_id`) VALUES
-- ('','');