/* eslint-disable no-unused-vars */
const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({
  name: String,
  slogan: String,
  description: String,
  category: String,
  default_price: String,
});

const stylesSchema = new mongoose.Schema({
  product_id: { type: mongoose.Schema.Types.ObjectId, ref: 'product' },
  name: String,
  original_price: String,
  sale_price: String,
  default: { type: Boolean },
});

const featureSchema = new mongoose.Schema({
  product_id: { type: mongoose.Schema.Types.ObjectId, ref: 'product' },
  feature: String,
  value: String,
});

const relatedSchema = new mongoose.Schema({
  product_id: { type: mongoose.Schema.Types.ObjectId, ref: 'product' },
  related: String,
});

const photosSchema = new mongoose.Schema({
  style_id: { type: mongoose.Schema.Types.ObjectId, ref: 'style' },
  thumbnail_url: String,
  url: String,
});

const skusSchema = new mongoose.Schema({
  style_id: { type: mongoose.Schema.Types.ObjectId, ref: 'style' },
  quantity: String,
  size: String,
});
