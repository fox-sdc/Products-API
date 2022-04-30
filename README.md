<p align="center">
  <img src="https://i.gyazo.com/6c03dccce176dcb79f35926f204363f8.png" />
</p>

# Products API
I was tasked with building a back-end microservice capable for handling 3000+ clients per second witha response time of 60m at every endpoint for an eCommerce website - I utilized NGINX as my load balancer to distribute requests across three Express servers deployed on Amazon EC2. These express servers queried a PostgreSQL database hosted on Amazon EC2 that held 10m+ rows of product data.

**Key Milestones:**
- ETL product data
- Designed database schema for product information, styles, photos, and SKUs
- Optimized queries to <5ms per query
- Built and deployed an API service using Node and Express; used Jest + Supertest for server tests, Artillery.io for local stress testing, and Loader.io to stress test the deployed microservice
- Implemented and configured NGINX to horizontally scale, resulting in an increase amount of requests per second and reliable response times

## Technologies and Tools
1. Node.js
2. Express
3. PostgreSQL
4. NGINX
5. Amazon EC2 
6. Artillery.io
7. Loader.io
8. Jest
9. Supertest
