SELECT * FROM tbl_company_registration;
SELECT * FROM tbl_employee;
SELECT * FROM tbl_address;
SELECT * FROM tbl_expenses;
SELECT * FROM tbl_category;
SELECT * FROM tbl_sales;

-- Try to update each row with sales_amount_return & employee_id by using below query and make sure that the values updated on these fields:- sales_amount_return, sales_amount_difference, sales_amount_return_timestamp

UPDATE tbl_sales SET sales_amount_return = 5500 WHERE employee_id = 4;