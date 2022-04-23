/* eslint-disable no-console */
const Router = require('express-promise-router');
const model = require('./model');

const router = new Router();

router.get('/products', async (req, res) => {
  try {
    const page = req.query.page || 1;
    const count = req.query.count || 5;
    const { rows } = await model.getProductsAsync(page, count);
    res.status(200).send(rows);
  } catch (err) {
    console.log(err.message);
    res.sendStatus(500);
  }
});

router.get('/products/:productId', async (req, res) => {
  try {
    const { productId } = req.params;
    const { rows } = await model.getProductByIdAsync(productId);
    res.status(200).send(rows[0]);
  } catch (err) {
    console.log(err.message);
    res.sendStatus(500);
  }
});

router.get('/products/:productId/styles', async (req, res) => {
  try {
    const { productId } = req.params;
    const { rows } = await model.getProductIdStylesAsync(productId);
    res.status(200).send({ product_id: productId, results: rows });
  } catch (err) {
    console.log(err.message);
    res.sendStatus(500);
  }
});

router.get('/products/:productId/related', async (req, res) => {
  try {
    const { productId } = req.params;
    const { rows } = await model.getProductIdRelatedAsync(productId);
    res.status(200).send(rows[0].related);
  } catch (err) {
    console.log(err.message);
    res.sendStatus(500);
  }
});

module.exports = router;
