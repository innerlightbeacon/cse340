/* =========================
   DROP EXISTING OBJECTS
   ========================= */
DROP TABLE IF EXISTS inventory CASCADE;
DROP TABLE IF EXISTS classification CASCADE;
DROP TABLE IF EXISTS account CASCADE;
DROP TYPE IF EXISTS account_type;

/* =========================
   CREATE TYPE
   ========================= */
CREATE TYPE account_type AS ENUM ('Client', 'Employee', 'Admin');

/* =========================
   CREATE TABLES
   ========================= */

CREATE TABLE account (
  account_id SERIAL PRIMARY KEY,
  account_firstname VARCHAR NOT NULL,
  account_lastname VARCHAR NOT NULL,
  account_email VARCHAR UNIQUE NOT NULL,
  account_password VARCHAR NOT NULL,
  account_type account_type DEFAULT 'Client'
);

CREATE TABLE classification (
  classification_id SERIAL PRIMARY KEY,
  classification_name VARCHAR NOT NULL
);

CREATE TABLE inventory (
  inv_id SERIAL PRIMARY KEY,
  inv_make VARCHAR NOT NULL,
  inv_model VARCHAR NOT NULL,
  inv_year CHAR(4) NOT NULL,
  inv_description TEXT NOT NULL,
  inv_image VARCHAR NOT NULL,
  inv_thumbnail VARCHAR NOT NULL,
  inv_miles INTEGER NOT NULL,
  classification_id INTEGER NOT NULL,
  CONSTRAINT fk_classification
    FOREIGN KEY (classification_id)
    REFERENCES classification(classification_id)
);

/* =========================
   INSERT SEED DATA
   ========================= */

INSERT INTO classification (classification_name)
VALUES
('Sport'),
('SUV'),
('Truck'),
('Sedan');

INSERT INTO inventory (
  inv_make,
  inv_model,
  inv_year,
  inv_description,
  inv_image,
  inv_thumbnail,
  inv_miles,
  classification_id
)
VALUES
(
  'GM',
  'Hummer',
  '2020',
  'A rugged vehicle with small interiors but strong performance.',
  '/images/hummer.jpg',
  '/images/hummer-tn.jpg',
  25000,
  3
),
(
  'Ford',
  'Mustang',
  '2021',
  'A fast and stylish sport car.',
  '/images/mustang.jpg',
  '/images/mustang-tn.jpg',
  12000,
  1
),
(
  'Chevy',
  'Camaro',
  '2022',
  'A modern sport coupe.',
  '/images/camaro.jpg',
  '/images/camaro-tn.jpg',
  15000,
  1
);

/* =========================
   ASSIGNMENT 2 REQUIRED QUERIES
   ========================= */

-- Query 4: Update GM Hummer description
UPDATE inventory
SET inv_description = REPLACE(
  inv_description,
  'small interiors',
  'a huge interior'
)
WHERE inv_make = 'GM'
AND inv_model = 'Hummer';

-- Query 6: Update image paths
UPDATE inventory
SET
  inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
  inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');
