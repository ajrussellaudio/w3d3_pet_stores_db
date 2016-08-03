DROP TABLE pets;
DROP TABLE stores;

CREATE TABLE stores (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  store_id INT4 REFERENCES stores(id)
);