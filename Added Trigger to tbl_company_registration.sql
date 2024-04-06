-- Before inserting a new record, verify that the `id` is new and not already there on the table!!
-- Add this trigger on the next line after create `tbl_company_registration`.

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


-- Add the new field `company_email` by using ALTER TABLE command

alter table `tbl_company_registration` add column `company_email` VARCHAR(50) NOT NULL after `company_username`;


-- Update the email field AND username field of `tbl_company_registration` by using UPDATE command and WHERE clause [update all the rows if more records in the table]

update tbl_company_registration set company_email='absupermarket@gmail.com', company_username = 'ABSuA1Z5' where company_id=1;

update tbl_company_registration set company_email='maxvalue007@gmail.com', company_username = 'MaxVJ9Z9' where company_id=2;


-- Make the email field as UNIQUE using ALTER TABLE command

alter table tbl_company_registration modify column `company_email` VARCHAR(50) UNIQUE NOT NULL;






-- Add the new field `company_phone` by using ALTER TABLE command

alter table `tbl_company_registration` add column `company_phone` VARCHAR(15) NOT NULL after `company_username`;

update tbl_company_registration set company_phone='7655675902' where company_id=1;
update tbl_company_registration set company_phone='8912327650' where company_id=2;
update tbl_company_registration set company_phone='9785409213' where company_id=3;

alter table tbl_company_registration modify column `company_phone` VARCHAR(15) UNIQUE NOT NULL;


-- Below Queries are Optional [to ensure that the trigger is working fine]

insert into tbl_address(address_id, address_name, address_post_office, address_city, address_district, address_state, address_country, address_zip) values(7,'Miracle Veg Stall', 'Siruseri', 'Chennai', 'Kanchipuram', 'Tamil Nadu', 'India', 98096);

insert into tbl_company_registration(company_id, address_id, company_name, company_gst_in, company_registration_year, company_phone, company_email, company_password_hash, company_description, company_active_status) value(3, 7, 'Miracle Stall', '13KYNPQ2002K4Z3', 2011, '9785409213', 'vegmiracle13@gmail.com', 'Sample@123', 'Description for the company Miracle Veg Stall. Good vegitables!', true);


-- 1/4/2024 - Update on tbl_sales
alter table tbl_sales add column sales_final_commit boolean default false;
update tbl_sales set sales_final_commit = 1 where sales_id=1;


-- Add new Table tbl_subcategory
CREATE TABLE IF NOT EXISTS tbl_subcategory (
    subcategory_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    subcategory_name VARCHAR(20) NOT NULL UNIQUE,
    
    foreign key (company_id) references tbl_company_registration(company_id)
);
 
insert into tbl_subcategory(subcategory_id, company_id, subcategory_name) 
	values 
	(1, 1, 'Fuel Price'),
        (2, 2, 'Packaging Cost'),
        (3, 3, 'Electrical Wiring');
       

-- 4/4/2024 - update on tbl_sales
alter table tbl_sales rename column sales_final_commit to sales_request_commit ;
alter table tbl_sales modify column sales_request_commit boolean default false;
alter table tbl_sales add column sales_return_commit boolean default false;
