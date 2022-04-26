/* eslint-disable no-console */
require('dotenv').config();

const express = require('express');
const cors = require('cors');

const controller = require('./controller');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use('/', controller);

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

module.exports = app;
