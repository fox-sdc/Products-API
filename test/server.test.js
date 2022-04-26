const request = require('supertest');
const app = require('../server/index');

describe('GET /products', () => {
  it('responds with 200 status', (done) => {
    request(app)
      .get('/products')
      .expect(200)
      .expect((res) => {
        res.body.length = 5;
        res.body[0].id = 1;
        res.body[4].id = 5;
      })
      .end((err) => {
        if (err) { return done(err); }

        return done();
      });
  });
});

describe('GET /products/1', () => {
  it('responds with 200 status', (done) => {
    request(app)
      .get('/products/1')
      .expect(200)
      .end((err) => {
        if (err) { return done(err); }

        return done();
      });
  });
});

describe('GET /products/1/styles', () => {
  it('responds with 200 status', (done) => {
    request(app)
      .get('/products/1/styles')
      .expect(200)
      .end((err) => {
        if (err) { return done(err); }

        return done();
      });
  });
});

describe('GET /products/1/related', () => {
  it('responds with 200 status', (done) => {
    request(app)
      .get('/products/1/related')
      .expect(200)
      .end((err) => {
        if (err) { return done(err); }

        return done();
      });
  });
});
