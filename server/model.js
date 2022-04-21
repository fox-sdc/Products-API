/* eslint-disable no-console */
const { Pool } = require('pg');

const pool = new Pool({
  user: 'seantrinh',
  host: 'localhost',
  database: 'test',
  password: '',
  port: 5432,
});

module.exports = {
  getProducts(page, count, callback) {
    pool.query('SELECT * FROM products LIMIT 5;', (err, res) => {
      if (err) {
        callback(err);
      }
      callback(null, res);
    });
  },
};
