-- ---
-- Table "products"
--
-- ---

COPY products
FROM '/Users/seantrinh/Documents/hackreactor/sdc/csvs/product.csv'
DELIMITER ',' CSV HEADER;

-- ---
-- Table "styles"
--
-- ---

COPY styles
FROM '/Users/seantrinh/Documents/hackreactor/sdc/csvs/styles.csv'
DELIMITER ',' CSV HEADER;

ALTER TABLE styles
RENAME COLUMN "productId" to "product_id";

ALTER TABLE styles
RENAME COLUMN "default_style" to "default?";

-- ---
-- Table "photos"
--
-- ---

COPY photos
FROM '/Users/seantrinh/Documents/hackreactor/sdc/csvs/photos.csv'
DELIMITER ',' CSV HEADER;

ALTER TABLE photos
RENAME COLUMN "styleId" to "style_id";

-- ---
-- Table "skus"
--
-- ---

COPY skus
FROM '/Users/seantrinh/Documents/hackreactor/sdc/csvs/skus.csv'
DELIMITER ',' CSV HEADER;

ALTER TABLE skus
RENAME COLUMN "styleId" to "style_id";

-- ---
-- Table "features"
--
-- ---

COPY features
FROM '/Users/seantrinh/Documents/hackreactor/sdc/csvs/features.csv'
DELIMITER ',' CSV HEADER;

-- ---
-- Table "realted_products"
--
-- ---

COPY related_products
FROM '/Users/seantrinh/Documents/hackreactor/sdc/csvs/related.csv'
DELIMITER ',' CSV HEADER;