require('dotenv').config();
const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
});

module.exports = {

  getProductsAsync(page, count) {
    const query = { text: '', values: [] };

    if (page === '1') {
      query.text = `
        SELECT *
        FROM products
        ORDER BY id ASC
        LIMIT 5`;
    } else {
      query.text = `
        SELECT *
        FROM products
        WHERE id > ($1 - 1) * 5
        ORDER BY id ASC
        LIMIT $2;
      `;
      query.values = [page, count];
    }

    return pool.query(query);
  },

  getProductByIdAsync(productId) {
    const query = { text: '', values: [] };

    query.text = `
      SELECT p.*,
      ARRAY_AGG(
        JSON_BUILD_OBJECT(
          'feature', f.feature,
          'value', f.value)
      ) features
      FROM products p
      LEFT JOIN features f ON p.id = f.product_id
      WHERE p.id = $1
      GROUP BY p.id;
    `;
    query.values = [productId];

    return pool.query(query);
  },

  getProductIdStylesAsync(productId) {
    const query = { text: '', values: [] };

    query.text = `
    SELECT
      s.id style_id,
      s.name,
      s.original_price,
      s.sale_price,
      s.default_style "default?",

      (SELECT COALESCE(photos, '[]'::JSON)
      FROM (
        SELECT
          JSON_AGG(
            JSON_BUILD_OBJECT(
              'thumbnail_url', photos.thumbnail_url,
              'url', photos.url
            )
          ) photos
        FROM photos
        WHERE photos.style_id = s.id
        ) photos
      ) photos,

      (SELECT COALESCE(skus, '{}'::JSON)
      FROM (
        SELECT
          JSON_OBJECT_AGG(
            skus.id,
            JSON_BUILD_OBJECT(
              'quantity', skus.quantity,
              'size', TRIM(skus.size)
            )
          ) skus
        FROM skus
        WHERE skus.style_id = s.id
        ) skus
      ) skus

    FROM styles s
    WHERE s.product_id = $1;
    `;
    query.values = [productId];

    return pool.query(query);
  },

  getProductIdRelatedAsync(productId) {
    const query = { text: '', values: [] };

    query.text = `
      SELECT
        ARRAY_AGG(related_product_id) related
      FROM related_products
      WHERE current_product_id = $1;
    `;
    query.values = [productId];

    return pool.query(query);
  },
};

/*
callback style below

      getProducts(page, count, callback) {
        const query = { text: '', values: [] };

        if (page === '1') {
          query.text = `
            SELECT *
            FROM products
            ORDER BY id ASC
            LIMIT 5`;
        } else {
          query.text = `
            SELECT *
            FROM products
            WHERE id > ($1 - 1) * 5
            ORDER BY id ASC
            LIMIT $2;
          `;
          query.values = [page, count];
        }

        pool.query(query, (err, res) => {
          if (err) {
            callback(err);
          }
          callback(null, res);
        });
      },

  getProductById(productId, callback) {
    const query = { text: '', values: [] };

    query.text = `
      SELECT p.*,
      ARRAY_AGG(
        JSON_BUILD_OBJECT(
          'feature', f.feature,
          'value', f.value)
      ) features
      FROM products p
      LEFT JOIN features f ON p.id = f.product_id
      WHERE p.id = $1
      GROUP BY p.id;
    `;
    query.values = [productId];

    pool.query(query, (err, res) => {
      if (err) {
        callback(err);
      }
      callback(null, res);
    });
  },

  getProductIdStyles(productId, callback) {
    const query = { text: '', values: [] };

    query.text = `
    SELECT
      s.id style_id,
      s.name,
      s.original_price,
      s.sale_price,
      s.default_style "default?",
      ARRAY_AGG(
        JSON_BUILD_OBJECT(
          'url', p.url,
          'thumbnail_url', p.thumbnail_url
        )
      ) photos,
      JSON_OBJECT_AGG(
        skus.id,
        JSON_BUILD_OBJECT(
          'quantity', skus.quantity,
          'size', TRIM(skus.size)
        )
      ) skus
    FROM styles s
    JOIN skus ON s.id = skus.style_id
    JOIN photos p ON s.id = p.style_id
    WHERE s.product_id=$1
    GROUP BY s.id;
    `;
    query.values = [productId];

    pool.query(query, (err, res) => {
      if (err) {
        callback(err);
      }
      callback(null, res);
    });
  },

  getProductIdRelated(productId, callback) {
    const query = { text: '', values: [] };

    query.text = `
      SELECT
        ARRAY_AGG(related_product_id) related
      FROM related_products
      WHERE current_product_id = $1;
    `;
    query.values = [productId];

    pool.query(query, (err, res) => {
      if (err) {
        callback(err);
      }
      callback(null, res);
    });
  },
*/
