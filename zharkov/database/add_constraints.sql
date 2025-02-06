
USE Catering1; 
GO 

ALTER TABLE dishes 
ALTER COLUMN id INT NOT NULL

ALTER TABLE dishes 
ALTER COLUMN name VARCHAR(255) NOT NULL

ALTER TABLE dishes 
ALTER COLUMN type_dishes VARCHAR(255) NOT NULL

ALTER TABLE dishes 
ALTER COLUMN image VARBINARY(MAX) NOT NULL

ALTER TABLE cooking 
ALTER COLUMN id INT NOT NULL

ALTER TABLE cooking 
ALTER COLUMN dishes_id INT NOT NULL

ALTER TABLE cooking 
ALTER COLUMN portions INT NOT NULL

ALTER TABLE cooking 
ALTER COLUMN date DATETIME NOT NULL

ALTER TABLE products 
ALTER COLUMN id INT NOT NULL

ALTER TABLE products 
ALTER COLUMN name VARCHAR(255)  NOT NULL

ALTER TABLE products 
ALTER COLUMN calories FLOAT(53) NOT NULL

ALTER TABLE products 
ALTER COLUMN weight INT  NOT NULL

ALTER TABLE products 
ALTER COLUMN price MONEY NOT NULL

ALTER TABLE structures 
ALTER COLUMN  id INT NOT NULL

ALTER TABLE structures 
ALTER COLUMN weight INT NOT NULL

ALTER TABLE dishes
ADD CONSTRAINT PK_dishes_id PRIMARY KEY(id)

ALTER TABLE cooking 
ADD CONSTRAINT PK_cooking_id PRIMARY KEY(id)

ALTER TABLE products 
ADD CONSTRAINT PK_products_id PRIMARY KEY(id)

ALTER TABLE structures 
ADD CONSTRAINT PK_structures_id PRIMARY KEY(id)


ALTER TABLE cooking 
ADD CONSTRAINT FK_products_dishes_id FOREIGN KEY (dishes_id)
REFERENCES dishes(id) ON DELETE CASCADE ON UPDATE CASCADE



ALTER TABLE structures 
ADD CONSTRAINT FK_structures_dishes_id FOREIGN KEY (dishes_id)
REFERENCES dishes(id) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE structures 
ADD CONSTRAINT FK_structures_product FOREIGN KEY (product) 
REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE


ALTER TABLE dishes
ADD CONSTRAINT dishes_check_preparation_time CHECK (preparation_time >= 0)

ALTER TABLE cooking
ADD CONSTRAINT cooking_check_portions CHECK (portions > 0)

ALTER TABLE products
ADD CONSTRAINT cooking_check_calories CHECK (calories > 0)

ALTER TABLE products
ADD CONSTRAINT cooking_check_weight CHECK (weight > 0)

ALTER TABLE products
ADD CONSTRAINT cooking_check_price CHECK (price > 0)

ALTER TABLE structures
ADD CONSTRAINT cooking_structures_weight CHECK (weight > 0)