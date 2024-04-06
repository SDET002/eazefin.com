-- Table Category

CREATE TABLE IF NOT EXISTS tbl_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(20) NOT NULL UNIQUE
);
 
insert into tbl_category(category_id, category_name) 
	values 
	(1, 'Sales'),
        (2, 'Capital Amount'),
        (3, 'Electricity Bill'),
        (4, 'Rent'),
        (5, 'Others');