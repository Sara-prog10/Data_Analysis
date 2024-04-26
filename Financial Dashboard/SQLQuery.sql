SELECT * 
FROM financial_loan

-- Total Loan Application

SELECT COUNT(id) AS Total_Loan_Applications FROM financial_loan

--Month to Date

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM financial_loan
WHERE MONTH(issue_date) =12 AND YEAR(issue_date) =2021

--Previous Month on Date

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM financial_loan
WHERE MONTH(issue_date) =11 AND YEAR(issue_date) =2021

--Total Funded Amount

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan

--Month to Date

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) =12 AND YEAR(issue_date) =2021

--Previous Month on Date

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) =11 AND YEAR(issue_date) =2021

--Total Received Amount

SELECT SUM(total_payment) AS Total_Amount_Received FROM financial_loan

--Month to Date

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM financial_loan
WHERE MONTH(issue_date) =12 AND YEAR(issue_date) =2021

--Previous Month to Date

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM financial_loan
WHERE MONTH(issue_date) =11 AND YEAR(issue_date) =2021

--Average Intrest Rate

SELECT ROUND(AVG(int_rate), 4) * 100 AS Average_Intrest_Rate FROM financial_loan

--Month To Date

SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Average_Intrest_Rate FROM financial_loan
WHERE MONTH(issue_date) =12 AND YEAR(issue_date) =2021

--Previous Month to Date

SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_Average_Intrest_Rate FROM financial_loan
WHERE MONTH(issue_date) =11 AND YEAR(issue_date) =2021

--Average Debt to Income Ratio

SELECT ROUND(AVG(dti), 4) * 100 AS Average_DTI FROM financial_loan

--Month To Date

SELECT ROUND(AVG(dti), 4) * 100 AS MTD_Average_DTI FROM financial_loan
WHERE MONTH(issue_date) =12 AND YEAR(issue_date) =2021

--Previous Month To Date

SELECT ROUND(AVG(dti), 4) * 100 AS PMTD_Average_DTI FROM financial_loan
WHERE MONTH(issue_date) =11 AND YEAR(issue_date) =2021

--Good Loan Percentage

SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

--Good Loan Applications

SELECT COUNT(id) AS Good_Loan_Appications
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Funded Amount

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Received Amount

SELECT SUM(total_payment) AS Good_Loan_Received_Amount
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Bad Loan Percentage

SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100)
	/
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan

--Bad Loan Applications

SELECT COUNT(id) AS Bad_Loan_Appications
FROM financial_loan
WHERE loan_status = 'Charged Off'

--Bad Loan Funded Amount

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM financial_loan
WHERE loan_status = 'Charged Off'

--Bad Loan Received Amount

SELECT SUM(total_payment) AS Bad_Loan_Received_Amount
FROM financial_loan
WHERE loan_status = 'Charged Off'

--Loan Status

SELECT
	loan_status,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Intrest_rate,
	AVG(dti *100) AS DTI
FROM financial_loan
GROUP BY loan_status

--MTD Loan Status

SELECT
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

--Monthly Trend By Issue Date

SELECT
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH,issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH,issue_date)
ORDER BY MONTH(issue_date)

--Regional Analysis By State

SELECT
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_received
FROM financial_loan
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC

--Term Analysis

SELECT
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_received
FROM financial_loan
GROUP BY term
ORDER BY term

-- Employee Length

SELECT
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_received
FROM financial_loan
GROUP BY emp_length
ORDER BY COUNT(id) DESC

-- Purpose Breakdown

SELECT
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_received
FROM financial_loan
GROUP BY purpose
ORDER BY COUNT(id) DESC

--Home OwnerShip

SELECT
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_received
FROM financial_loan
GROUP BY home_ownership
ORDER BY COUNT(id) DESC