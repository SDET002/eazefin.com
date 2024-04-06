-- Table Address
 
CREATE TABLE IF NOT EXISTS tbl_address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    address_name VARCHAR(30) NOT NULL UNIQUE,
    address_post_office VARCHAR(30) NOT NULL,
    address_city VARCHAR(30) NOT NULL,
    address_district VARCHAR(30) NOT NULL,
    address_state VARCHAR(30) NOT NULL,
    address_country VARCHAR(30) NOT NULL,
    address_zip INT(8) NOT NULL
);
 
insert into tbl_address(address_id, address_name, address_post_office, address_city, address_district, address_state, address_country, address_zip) values(1, 'All Bazar Supermart', 'Navalur', 'Chennai', 'Kanchipuram', 'Tamil Nadu', 'India', 98099);
 
insert into tbl_address(address_id, address_name, address_post_office, address_city, address_district, address_state, address_country, address_zip) values(2,'Max Value minimart', 'Sholinganallur', 'Chennai', 'Kanchipuram', 'Tamil Nadu', 'India', 98095);
 