USE EC_IT143_DA;
GO

-- 1. Create the table structure
DROP TABLE IF EXISTS dbo.finance_transactions_jm;
GO

CREATE TABLE dbo.finance_transactions_jm (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    transaction_date DATE,
    category VARCHAR(50),
    description VARCHAR(100),
    amount DECIMAL(10, 2), -- 2 decimals for currency
    transaction_type VARCHAR(20) -- 'Income' or 'Expense'
);
GO

-- 2. Populate with realistic data
INSERT INTO dbo.finance_transactions_jm (transaction_date, category, description, amount, transaction_type)
VALUES 
('2024-01-01', 'Income', 'Salary', 3000.00, 'Income'),
('2024-01-03', 'Housing', 'Rent Payment', 1200.00, 'Expense'),
('2024-01-05', 'Groceries', 'Walmart', 154.30, 'Expense'),
('2024-01-07', 'Utilities', 'Electric Bill', 85.50, 'Expense'),
('2024-01-10', 'Entertainment', 'Steam Game Purchase', 59.99, 'Expense'),
('2024-01-15', 'Dining Out', 'Pizza Night', 42.15, 'Expense'),
('2024-01-20', 'Transport', 'Gas Station', 45.00, 'Expense');
GO

-- 3. Verify it works
SELECT * FROM dbo.finance_transactions_jm;
