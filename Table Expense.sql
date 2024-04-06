-- Table Expense

CREATE TABLE IF NOT EXISTS tbl_expenses (
    expenses_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    category_id INT NOT NULL,
    expenses_initial_capital_amount DECIMAL(10, 2) NOT NULL,
    expenses_updated_capital_amount DECIMAL(10, 2) NOT NULL,
    expenses_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (company_id)
        REFERENCES tbl_company_registration (company_id),

    FOREIGN KEY (category_id)
        REFERENCES tbl_category (category_id)
);
 
insert into tbl_expenses
	(expenses_id, company_id, category_id, expenses_initial_capital_amount, expenses_updated_capital_amount) 
    values 
		(1,1,2,500000.00, 00.00), 
        (2,2,2,250000.00, 00.00), 
        (3,1,1,200000.00, 00.00), 
        (4,2,1,170000.00, 00.00), 
        (5,1,4,78000.00, 00.00), 
        (6,1,3,42000.00, 00.00), 
        (7,2,3,30000.00, 00.00), 
        (8,2,4,30000.00, 00.00);