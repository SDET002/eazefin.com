-- Table Employee

CREATE TABLE IF NOT EXISTS tbl_employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    user_address_id INT NULL,
    employee_date_of_birth DATE NOT NULL,
    employee_age INT(2) NOT NULL,
    employee_aadhaar_number NVARCHAR(12) UNIQUE NOT NULL,
    employee_emp_id VARCHAR(8) UNIQUE NOT NULL,
    employee_salary DOUBLE NOT NULL,
    employee_joined_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    employee_first_name VARCHAR(20) NOT NULL,
    employee_middle_name VARCHAR(20) NULL,
    employee_last_name VARCHAR(20) NOT NULL,
    employee_email VARCHAR(50) UNIQUE NOT NULL,
    employee_primary_contact VARCHAR(15) NOT NULL UNIQUE,
    employee_secondary_contact VARCHAR(15) NULL,
    employee_password_hash VARCHAR(20) NOT NULL,
    employee_active_status BOOL NOT NULL DEFAULT TRUE,

    FOREIGN KEY (company_id)
        REFERENCES tbl_company_registration (company_id),

    FOREIGN KEY (user_address_id)
        REFERENCES tbl_address (address_id)
);


 DELIMITER $$
	CREATE TRIGGER calculate_age
    BEFORE INSERT ON tbl_employee
    FOR EACH ROW 
    BEGIN
		DECLARE dob DATE;
        DECLARE age INT;
        
        SET dob = NEW.employee_date_of_birth;
        SET age = YEAR(CURRENT_DATE()) - YEAR(dob);
        
        IF(MONTH(CURRENT_DATE()) < MONTH(dob) OR (MONTH(CURRENT_DATE()) = MONTH(dob) AND DAY(CURRENT_DATE()) < DAY(dob))) THEN
			SET age = age-1;
		END IF;
        
        SET NEW.employee_age = age;
    END$$
DELIMITER ;
 
insert into tbl_address
	(address_id, address_name, address_post_office, address_city, address_district, address_state, address_country, address_zip) 
	values
		(3,'Suresh Bhavan', 'Mannoothy', 'Thrissur', 'Thrissur', 'Kerala', 'India', 609876),
		(4,'Athul Villa', 'Kuttikkanam', 'Peerumedu', 'Idukki', 'Kerala', 'India', 621276),
	        (5,'Angel', 'Koramangala', 'Bangalore', 'Bangalore', 'Karnataka', 'India', 609876),
        	(6,'Sunny Meadows', 'Thiruporur', 'Chennai', 'Kanchipuram', 'Tamil Nadu', 'India', 603110);
 
insert into tbl_employee
	(employee_id, company_id, user_address_id, employee_date_of_birth, employee_aadhaar_number, employee_emp_id, employee_salary, employee_first_name, employee_middle_name, employee_last_name, employee_email, employee_primary_contact, employee_secondary_contact, employee_password_hash, employee_active_status) 

	values
		(1,1,3,'1990-02-28', 123412341234, 'AB01', 15000.0, 'Suresh', '', 'R','r.suresh@hotmail.com', '+919876543210', '+917080970809','Suresh@123', true),
        (2,1,4,'1998-10-12', 121212121212, 'AB02', 10000.0, 'Vishnu', 'Athul', 'Saji','vishnuas@gmail.com', '+919080706050', '+918281807978','Vishnu@123', true),
        (3,2,5,'2000-05-02', 123443211234, 'MM01', 18000.0, 'Robert', 'Babu', 'Sini','robertbabu@gmail.com', '+919995559990', '','Robert@123', true),
        (4,2,6,'1995-01-23', 180021004500, 'MM02', 22000.0, 'Dabzee', 'Fejo', 'N','dabzee@yahoo.com', '+917560908700', '+917558890123','Dabzee@123', true);
