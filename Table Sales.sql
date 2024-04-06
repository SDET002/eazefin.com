-- Table Sales

CREATE TABLE IF NOT EXISTS tbl_sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    sales_transaction_id VARCHAR(36) unique,
    sales_amount_request DECIMAL(10, 2) NOT NULL,
    sales_amount_return DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    sales_amount_difference DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    sales_amount_request_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sales_amount_return_timestamp TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    sales_request_status BOOLEAN DEFAULT FALSE,
    sales_display_status BOOLEAN DEFAULT TRUE,
    sales_return_status BOOLEAN DEFAULT FALSE,
    sales_request_commit boolean default false,
    sales_return_commit boolean default false,
    
    FOREIGN KEY (employee_id)
        REFERENCES tbl_employee (employee_id)
);
 
DELIMITER $$
	CREATE TRIGGER calculate_amount_difference
    BEFORE UPDATE ON tbl_sales
    FOR EACH ROW 
    BEGIN
		IF OLD.sales_amount_return != NEW.sales_amount_return THEN
			SET NEW.sales_amount_difference = NEW.sales_amount_return - NEW.sales_amount_request;

        END IF;
    END$$
DELIMITER ;
 
DELIMITER $$
    CREATE TRIGGER amount_return_timestamp
    BEFORE UPDATE ON tbl_sales
    FOR EACH ROW 
    BEGIN
		IF OLD.sales_amount_return != NEW.sales_amount_return THEN
			SET NEW.sales_amount_return_timestamp = current_timestamp() ;
		ELSE
			SET NEW.sales_amount_return_timestamp = null ;
		END IF;
	END $$
DELIMITER ;
 
DELIMITER $$
	CREATE TRIGGER transaction_id
	BEFORE INSERT ON tbl_sales
	FOR EACH ROW
	BEGIN
		SET NEW.sales_transaction_id = LEFT(UUID(), 15);
	END $$
DELIMITER ;
 
insert into tbl_sales (employee_id, sales_amount_request)
    value (4,5000.00);
insert into tbl_sales (employee_id, sales_amount_request)
        value (1,7000.00);
insert into tbl_sales (employee_id, sales_amount_request)
	value (3,1000.00);
insert into tbl_sales (employee_id, sales_amount_request)
        value (2,3000.00);
insert into tbl_sales (employee_id, sales_amount_request)
	value (1,5000.00);