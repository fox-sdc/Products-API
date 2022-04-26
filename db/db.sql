-- ---
-- Table "products"
--
-- ---

DROP TABLE IF EXISTS "products", "styles", "photos", "skus", "features", "related_products";

CREATE TABLE "products" (
  "id" INTEGER NULL DEFAULT NULL,
  "name" VARCHAR(125) NULL DEFAULT NULL,
  "slogan" VARCHAR(255) NULL DEFAULT NULL,
  "description" VARCHAR(5000) NULL DEFAULT NULL,
  "category" VARCHAR(125) NULL DEFAULT NULL,
  "default_price" VARCHAR(125) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'styles'
--
-- ---

CREATE TABLE "styles" (
  "id" INTEGER NULL DEFAULT NULL,
  "productId" INTEGER NULL DEFAULT NULL,
  "name" VARCHAR(125) NULL DEFAULT NULL,
  "sale_price" VARCHAR(125) NULL DEFAULT NULL,
  "original_price" VARCHAR(125) NULL DEFAULT NULL,
  "default_style" BOOLEAN,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'photos'
--
-- ---

CREATE TABLE "photos" (
  "id" INTEGER NULL DEFAULT NULL,
  "styleId" INTEGER NULL DEFAULT NULL,
  "url" VARCHAR(5000) NULL DEFAULT NULL,
  "thumbnail_url" VARCHAR(40000) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'skus'
--
-- ---

CREATE TABLE "skus" (
  "id" INTEGER NULL DEFAULT NULL,
  "styleId" INTEGER NULL DEFAULT NULL,
  "size" CHAR(10) NULL DEFAULT NULL,
  "quantity" INTEGER NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'features'
--
-- ---

CREATE TABLE "features" (
  "id" INTEGER NULL DEFAULT NULL,
  "product_id" INTEGER NULL DEFAULT NULL,
  "feature" VARCHAR(125) NULL DEFAULT NULL,
  "value" VARCHAR(125) NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Table 'related_products'
--
-- ---

CREATE TABLE "related_products" (
  "id" INTEGER NULL DEFAULT NULL,
  "current_product_id" INTEGER NULL DEFAULT NULL,
  "related_product_id" INTEGER NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE "styles" ADD FOREIGN KEY ("productId") REFERENCES "products" ("id");
ALTER TABLE "photos" ADD FOREIGN KEY ("styleId") REFERENCES "styles" ("id");
ALTER TABLE "skus" ADD FOREIGN KEY ("styleId") REFERENCES "styles" ("id");
ALTER TABLE "features" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
ALTER TABLE "related_products" ADD FOREIGN KEY ("current_product_id") REFERENCES "products" ("id");

-- ---
-- Indexing
-- ---
CREATE INDEX "features_product_id" ON features (product_id);
CREATE INDEX "photos_style_id" ON photos (style_id);
CREATE INDEX "skus_style_id" ON skus (style_id);
CREATE INDEX "related_products_current_product_id" on related_products (current_product_id);
CREATE INDEX "styles_product_id" ON styles (product_id);