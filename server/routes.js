/* eslint-disable no-console */
const router = require('express').Router();
const model = require('./model');

router.get('/products', (req, res) => {
  const page = req.query.page || 1;
  const count = req.query.count || 5;

  model.getProducts(page, count, (err, result) => {
    if (err) {
      console.log(err);
      res.send(500);
    } else {
      res.send(result.rows);
    }
  });
});

module.exports = router;
