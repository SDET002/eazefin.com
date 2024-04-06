-- Sub category Table

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
        