-- Table Company Registration

CREATE TABLE IF NOT EXISTS tbl_company_registration (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    address_id INT NOT NULL,
    company_name VARCHAR(50) NOT NULL,
    company_gst_in VARCHAR(15) UNIQUE NOT NULL,
    company_registration_year INT(4) NOT NULL,
    company_register_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    company_username VARCHAR(15) UNIQUE NOT NULL,
    company_phone VARCHAR(15) UNIQUE NOT NULL,
    company_email VARCHAR(50) UNIQUE NOT NULL,
    company_password_hash VARCHAR(15) NOT NULL,
    company_description VARCHAR(255) NOT NULL,
    company_active_status BOOLEAN NULL DEFAULT TRUE,

    CONSTRAINT registration_of_year CHECK (company_registration_year > 1800
        AND company_registration_year <= YEAR(SYSDATE())),
	foreign key(address_id) references tbl_address(address_id) 
);
 
DELIMITER $$
	CREATE TRIGGER generate_username
	BEFORE INSERT ON tbl_company_registration
	FOR EACH ROW
	BEGIN
	  DECLARE username_part1 VARCHAR(25);
	  DECLARE username_part2 VARCHAR(16);

	  SET username_part1 = REPLACE(NEW.company_name, ' ', '');
	  IF LENGTH(username_part1) > 3 THEN
		SET username_part1 = LEFT(username_part1, 4);
	  END IF;

	  SET username_part2 = RIGHT(NEW.company_gst_in, 4);

	  SET NEW.company_username = CONCAT(username_part1, username_part2);
	END $$
DELIMITER ;
 
insert into tbl_company_registration(company_id, address_id, company_name, company_gst_in, company_registration_year, company_phone, company_email, company_password_hash, company_description, company_active_status) value (1, 1, 'AB Supermart', '22AAAAA0000A1Z5', 2014, '7655675902', 'absupermarket@gmail.com', 'Sample@123', 'Description for the company AB Supermart. All in one mart!', true);
 
insert into tbl_company_registration(company_id, address_id, company_name, company_gst_in, company_registration_year, company_phone, company_email, company_password_hash, company_description, company_active_status) value(2, 2, 'Max Value', '07FFFFF1212J9Z9', 2022, '8912327650', 'maxvalue007@gmail.com', 'Sample@123', 'Description for the company Max Value mart. Best of all mart!', true);