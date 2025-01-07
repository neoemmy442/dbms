-- i
ALTER TABLE properties
ADD CONSTRAINT chk_status
CHECK (Status IN ('Available', 'Sold', 'Rented'));

-- ii
ALTER TABLE Agents
ADD CONSTRAINT chk_commission_rate
CHECK (CommissionRate BETWEEN 1 AND 15);

-- iii
ALTER TABLE Transactions
ADD CONSTRAINT chk_transaction_amount
CHECK (Amount <= (SELECT Price FROM properties WHERE properties.PropertyID = Transactions.PropertyID));
