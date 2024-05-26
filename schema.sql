
CREATE TABLE tb_users (
	user_id INT NOT NULL,
	user_first_name VARCHAR(255) NOT NULL,
	user_last_name VARCHAR(255) NOT NULL,
	user_gender VARCHAR(50) NOT NULL,
	user_address VARCHAR(255),
	user_birthday DATE NOT NULL,
	user_join DATE NOT NULL,
	PRIMARY KEY (user_id)
);
	
CREATE TABLE tb_payments (
	payment_id INT NOT NULL,
	payment_name VARCHAR(255) NOT NULL,
	payment_status BOOLEAN NOT NULL,
	PRIMARY KEY (payment_id)
);
	
CREATE TABLE tb_shippers (
	shipper_id INT NOT NULL,
	shipper_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (shipper_id)
);
	
CREATE TABLE tb_ratings (
	rating_id INT NOT NULL,
	rating_level INT NOT NULL,
	rating_status VARCHAR(255) NOT NULL,
	PRIMARY KEY (rating_id)
);
	
CREATE TABLE tb_product_category (
	product_category_id INT NOT NULL,
	product_category_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (product_category_id)
);
	
CREATE TABLE tb_vouchers (
	voucher_id INT NOT NULL,
	voucher_name VARCHAR(255) NOT NULL,
	voucher_price INT,
	voucher_created DATE NOT NULL,
	user_id INT NOT NULL,
	PRIMARY KEY (voucher_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES tb_users (user_id)
);
	
CREATE TABLE tb_orders (
	order_id INT NOT NULL,
	order_date DATE NOT NULL,
	user_id INT NOT NULL,
	payment_id INT NOT NULL,
	shipper_id INT NOT NULL,
	order_price INT NOT NULL,
	order_discount INT,
	voucher_id INT,
	order_total INT NOT NULL,
	rating_id INT NOT NULL,
	PRIMARY KEY (order_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES tb_users (user_id),
	CONSTRAINT fk_payment_id FOREIGN KEY (payment_id) REFERENCES tb_payments (payment_id),
	CONSTRAINT fk_shipper_id FOREIGN KEY (shipper_id) REFERENCES tb_shippers (shipper_id),
	CONSTRAINT fk_rating_id FOREIGN KEY (rating_id) REFERENCES tb_ratings (rating_id)
);
	
CREATE TABLE tb_products (
	product_id INT NOT NULL,
	product_category_id INT NOT NULL,
	product_name VARCHAR(255) NOT NULL,
	product_created DATE NOT NULL,
	product_price INT NOT NULL,
	product_discount INT,
	PRIMARY KEY (product_id),
	CONSTRAINT fk_product_category_id FOREIGN KEY (product_category_id) REFERENCES tb_product_category (product_category_id)
);
	
CREATE TABLE tb_order_items (
	order_item_id INT NOT NULL ,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	order_item_quantity INT,
	product_discount INT,
	product_subdiscount INT,
	product_price INT NOT NULL,
	product_subprice INT NOT NULL,
	PRIMARY KEY (order_item_id),
	CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES tb_products (product_id),
	CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES tb_orders (order_id)
);