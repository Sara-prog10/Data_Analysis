# BANK LOAN REPORT
## PROBLEM STATEMENT
### DASHBOARD 1: SUMMARY
In order to monitor and assess our bank's lending activities and performance, we need to create a comprehensive Bank Loan Report. This report aims to provide insights into key loan-related metrics and their changes over time. The report will help us make data-driven decisions, track our loan portfolio's health, and identify trends that can inform our lending strategies.

![Summary](https://github.com/Sara-prog10/Data_Analysis/assets/69248970/33a099eb-3768-46d4-aee2-d5622b99daa2)

#### Key Performance Indicators (KPIs) Requirements:
1.	Total Loan Applications: We need to calculate the total number of loan applications received during a specified period. Additionally, it is essential to monitor the Month-to-Date (MTD) Loan Applications and track changes Month-over-Month (MoM).
2.	Total Funded Amount: Understanding the total amount of funds disbursed as loans is crucial. We also want to keep an eye on the MTD Total Funded Amount and analyse the Month-over-Month (MoM) changes in this metric.
3.	Total Amount Received: Tracking the total amount received from borrowers is essential for assessing the bank's cash flow and loan repayment. We should analyse the Month-to-Date (MTD) Total Amount Received and observe the Month-over-Month (MoM) changes.
4.	Average Interest Rate: Calculating the average interest rate across all loans, MTD, and monitoring the Month-over-Month (MoM) variations in interest rates will provide insights into our lending portfolio's overall cost.
5.	Average Debt-to-Income Ratio (DTI): Evaluating the average DTI for our borrowers helps us gauge their financial health. We need to compute the average DTI for all loans, MTD, and track Month-over-Month (MoM) fluctuations.


#### Good Loan v Bad Loan KPI’s
In order to evaluate the performance of our lending activities and assess the quality of our loan portfolio, we need to create a comprehensive report that distinguishes between 'Good Loans' and 'Bad Loans' based on specific loan status criteria

![Good Loan vs Bad Loan](https://github.com/Sara-prog10/Data_Analysis/assets/69248970/8b943cf0-11ec-4b0c-98f4-b98088f712ab)

Good Loan KPIs:
1.	Good Loan Application Percentage: We need to calculate the percentage of loan applications classified as 'Good Loans.' This category includes loans with a loan status of 'Fully Paid' and 'Current.'
2.	Good Loan Applications: Identifying the total number of loan applications falling under the 'Good Loan' category, which consists of loans with a loan status of 'Fully Paid' and 'Current.'
3.	Good Loan Funded Amount: Determining the total amount of funds disbursed as 'Good Loans.' This includes the principal amounts of loans with a loan status of 'Fully Paid' and 'Current.'
4.	Good Loan Total Received Amount: Tracking the total amount received from borrowers for 'Good Loans,' which encompasses all payments made on loans with a loan status of 'Fully Paid' and 'Current.'

![Good Loan](https://github.com/Sara-prog10/Data_Analysis/assets/69248970/63c6e0e7-a9d0-4da9-874c-1ac485ec9069)

#### Bad Loan KPIs:
1.	Bad Loan Application Percentage: Calculating the percentage of loan applications categorized as 'Bad Loans.' This category specifically includes loans with a loan status of 'Charged Off.'
2.	Bad Loan Applications: Identifying the total number of loan applications categorized as 'Bad Loans,' which consists of loans with a loan status of 'Charged Off.'
3.	Bad Loan Funded Amount: Determining the total amount of funds disbursed as 'Bad Loans.' This comprises the principal amounts of loans with a loan status of 'Charged Off.'
4.	Bad Loan Total Received Amount: Tracking the total amount received from borrowers for 'Bad Loans,' which includes all payments made on loans with a loan status of 'Charged Off.'

![Bad Loan](https://github.com/Sara-prog10/Data_Analysis/assets/69248970/d87dd04b-6528-4168-92be-295363785b03)

#### Loan Status Grid View
In order to gain a comprehensive overview of our lending operations and monitor the performance of loans, we aim to create a grid view report categorized by 'Loan Status.' This report will serve as a valuable tool for analysing and understanding the key indicators associated with different loan statuses. By providing insights into metrics such as 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received,' 'Month-to-Date (MTD) Funded Amount,' 'MTD Amount Received,' 'Average Interest Rate,' and 'Average Debt-to-Income Ratio (DTI),' this grid view will empower us to make data-driven decisions and assess the health of our loan portfolio.

![Loan Status](https://github.com/Sara-prog10/Data_Analysis/assets/69248970/d4abea49-be20-41dc-bbe2-3654b580ef37)

### DASHBOARD 2: OVERVIEW
In our Bank Loan Report project, we aim to visually represent critical loan-related metrics and trends using a variety of chart types. These charts will provide a clear and insightful view of our lending operations, facilitating data-driven decision-making and enabling us to gain valuable insights into various loan parameters. Below are the specific chart requirements:

![Overview](https://github.com/Sara-prog10/Data_Analysis/assets/69248970/d26a8f4e-5e88-4c10-9c86-70dc954f9b44)

1. Monthly Trends by Issue Date (Line Chart):
Chart Type: Line Chart
Metrics: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'
X-Axis: Month (based on 'Issue Date')
Y-Axis: Metrics' Values
Objective: This line chart will showcase how 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received' vary over time, allowing us to identify seasonality and long-term trends in lending activities.

2. Regional Analysis by State (Filled Map):
Chart Type: Filled Map
Metrics: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'
Geographic Regions: States
Objective: This filled map will visually represent lending metrics categorized by state, enabling us to identify regions with significant lending activity and assess regional disparities.

3. Loan Term Analysis (Donut Chart):
Chart Type: Donut Chart
Metrics: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'
Segments: Loan Terms (e.g., 36 months, 60 months)
Objective: This donut chart will depict loan statistics based on different loan terms, allowing us to understand the distribution of loans across various term lengths.

4. Employee Length Analysis (Bar Chart):
Chart Type: Bar Chart
Metrics: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'
X-Axis: Employee Length Categories (e.g., 1 year, 5 years, 10+ years)
Y-Axis: Metrics' Values
Objective: This bar chart will illustrate how lending metrics are distributed among borrowers with different employment lengths, helping us assess the impact of employment history on loan applications.

5. Loan Purpose Breakdown (Bar Chart):
Chart Type: Bar Chart
Metrics: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'
X-Axis: Loan Purpose Categories (e.g., debt consolidation, credit card refinancing)
Y-Axis: Metrics' Values
Objective: This bar chart will provide a visual breakdown of loan metrics based on the stated purposes of loans, aiding in the understanding of the primary reasons borrowers seek financing.

6. Home Ownership Analysis (Tree Map):
Chart Type: Tree Map
Metrics: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'
Hierarchy: Home Ownership Categories (e.g., own, rent, mortgage)
Objective: This tree map will display loan metrics categorized by different home ownership statuses, allowing for a hierarchical view of how home ownership impacts loan applications and disbursements.

### DASHBOARD 3: DETAILS

In our Bank Loan Report project, we recognize the need for a comprehensive 'Details Dashboard' that provides a consolidated view of all the essential information within our loan data. This Details Dashboard aims to offer a holistic snapshot of key loan-related metrics and data points, enabling users to access critical information efficiently.
Objective:
The primary objective of the Details Dashboard is to provide a comprehensive and user-friendly interface for accessing vital loan data. It will serve as a one-stop solution for users seeking detailed insights into our loan portfolio, borrower profiles, and loan performance.

![Details](https://github.com/Sara-prog10/Data_Analysis/assets/69248970/bd634a91-f29d-4e4c-b418-11ff74246fa8)
