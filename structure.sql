CREATE TABLE `tax`(
	pk_tax_id INT NOT NULL AUTO_INCREMENT,
	tax_type VARCHAR(20),
	tax_percentage INT,
	PRIMARY KEY(pk_tax_id)
);

CREATE TABLE `transaction`(
	pk_transaction_id INT NOT NULL AUTO_INCREMENT,
	fk_driver_id INT NOT NULL,
	fk_passenger_id INT NOT NULL,
	payment_method VARCHAR(30),
	fk_tax_id INT,
	amount_paid_by_passenger INT,
	percentage_paid_to_driver INT,
	transaction_date DATE,
	PRIMARY KEY(pk_transaction_id),
	FOREIGN KEY(fk_tax_id) REFERENCES tax(pk_tax_id)
);