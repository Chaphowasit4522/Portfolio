# Sales Project

## Business request

Mark Steven - Sales Manager:
Hi Big!
I hope you are doing well. We need to improve our ``internet sales reports`` and want to move from static reports to `visual dashboards`.
Essentially, we want to focus it on how much we have `sold of what products` , to which clients and how `it has been over time`.
Seeing as each `sales person` works on different products and customers it would be beneficial to be able to `filter them also`.
We measure our numbers against `budget` so I added that in a `spreadsheet` so we can compare our values against performance.
The budget is for 2021 and we usually look `4 years back` in time when we do analysis of sales.
Let me know if you need anything else!

// Mark Steven

## Introduction

In response to the business request from Mark Steven, the Sales Manager, our team embarked on a project aimed at enhancing internet sales reporting within the organization. The primary objective was to transition from static reports to dynamic visual dashboards that provide a comprehensive view of sales performance, including product sales, customer insights, historical trends, and budget comparisons. This transformation allows sales personnel to gain valuable insights, make data-driven decisions, and ultimately drive revenue growth.

The project leveraged SQL Server Express as the database management system to efficiently store and manage the necessary data while ensuring optimal performance. We chose the AdventureWorks database, which offered a diverse and robust dataset, enabling us to demonstrate our SQL skills effectively. Additionally, Azure SQL Server Management Studio (SSMS) was integrated into our workflow to facilitate data querying and manipulation, ensuring that we met the specific requirements of each business request.

## Data Description

To fulfill the objectives of the Sales Project, we selected and worked with five essential tables in AdventureWorks database, each serving a unique purpose in our reporting and analysis:

1. **dim_date**
This table contains information related to dates, including date keys, months, and years associated with each date. It serves as a foundational component for time-based analysis and reporting.
2. **dim_customer**
The dim_customer table provides valuable insights into our customers, including unique customer keys, customer names, genders, date of purchase, and their respective cities. This data is essential for understanding customer demographics and purchase behavior.
3. **dim_product**
Information about each product is stored in the dim_product table. It includes unique product keys, product names, sub-categories, and additional attributes that describe the products in detail. This data enables us to analyze and track product-specific sales and performance.
4. **fact_internetsales**
The fact_internetsales table represents numerical facts related to internet sales. It includes key metrics such as ProductKey, OrderDateKey, CustomerKey, and SalesAmount, which are crucial for measuring sales performance and trends over time.
5. **fact_budget** (from spreadsheet)
This table represents budget information associated with each date. It allows us to compare actual sales figures against budgeted values, facilitating performance evaluation and financial analysis.
In summary, these tables collectively provide a comprehensive dataset for our internet sales reporting and analysis. By utilizing these data sources, we aim to create dynamic visual dashboards that empower our sales team to gain insights into product sales, customer behavior, historical trends, and budget performance. These dashboards will offer powerful filtering capabilities, allowing sales personnel to tailor their analysis to specific products, customers, and timeframes. Additionally, the historical data spans four years, enabling a thorough examination of sales performance over time.

## Technologies & Tools

1. **SQL Server Express**
Purpose: SQL Server Express was selected as the primary database management system (DBMS) for the project. It facilitated the efficient storage and management of data while ensuring optimal performance.
2. **AdventureWorks Database**
Purpose: The AdventureWorks database served as the data source for the project. It provided a rich and diverse dataset that allowed us to effectively demonstrate SQL skills and meet the project's requirements.
3. **Azure SQL Server Management Studio (SSMS)**
Purpose: Azure SQL Server Management Studio was integrated into the workflow to enhance data querying and manipulation. Its powerful querying capabilities were instrumental in extracting and transforming data to meet specific business requests.
4. **Power BI**
Purpose: Power BI was used to create dynamic visual dashboards for internet sales reporting. It enabled the transformation of static reports into interactive, visually appealing dashboards that provide insights into product sales, customer behavior, historical trends, and budget comparisons.
5. **Spreadsheet Software**
Purpose: Spreadsheet software was employed to extract budget data, which was then incorporated into the project as the "fact_budget" table. This data was crucial for comparing actual sales figures against budgeted values and conducting financial analysis.
6. **Data Export and Integration Tools**
Purpose: Various data export and integration tools were used to seamlessly transfer data from SQL Server Express, Azure SSMS, and spreadsheets to Power BI for dashboard creation. These tools ensured data accuracy and consistency throughout the project.
7. **Business Intelligence and Data Visualization Techniques**
Purpose: Various business intelligence and data visualization techniques were applied within Power BI to create meaningful charts, graphs, and interactive elements in the dashboards. These techniques ensured that the data was presented in a way that facilitated easy comprehension and decision-making.

## Project Objective

The primary objective of the Internet Sales Enhancement and Visualization project is to transform static internet sales reports into dynamic visual dashboards. These dashboards will provide a comprehensive view of sales performance, enabling the sales team to analyze product sales, customer behavior, historical trends, and budget comparisons. Key project goals include:

**Dynamic Dashboards**: Create interactive and visually appealing dashboards that replace static reports, facilitating a more engaging and insightful user experience.

**Product Sales Analysis**: Enable users to analyze how much has been sold for each product, allowing for a deeper understanding of product performance.

**Customer Insights**: Provide insights into customer demographics, behavior, and purchase patterns to support targeted marketing and sales strategies.

**Historical Trends**: Enable historical analysis of sales data spanning four years, allowing users to identify trends, seasonality, and performance changes over time.

**Filtering Capabilities**: Implement robust filtering options to enable users to tailor their analysis by selecting specific products, customers, and timeframes.

**Budget Comparison**: Integrate budget data and enable comparisons between actual sales figures and budgeted values for performance evaluation.

## Process

1. Using SQL Server Express as the database management system for my project . This choice allowed me to efficiently store and manage data while ensuring optimal performance. I decided to work with the AdventureWorks database, which provided a rich set of sample data to work with, enabling me to demonstrate my SQL skills effectively.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled.png)

1. To enhance the functionality of my project, I incorporated Azure SQL Server Management Studio (SSMS) into my workflow. With the help of SSMS, I efficiently queried files based on specific business requests. By utilizing the powerful querying capabilities of SSMS, I was able to extract and manipulate data to meet the unique requirements of each request.

We have selected `five` tables to use for this requirement. 

- dim_date - represents dates column. This table provides information about the date, including the month and year associated with each datekey.
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%201.png)
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%202.png)
    
- dim_customer - represents information about customers like unique customer key, name, gender, date of purchase, and city.
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%203.png)
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%204.png)
    
- dim_product - represents information about each product, including a unique product key, the name of the product, the sub-category it belongs to, and additional attributes that describe the product in more detail.
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%205.png)
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%206.png)
    
- fact_internetsales - represents numerical facts related to internet sales. It includes the following numeric columns: ProductKey, OrderDateKey, CustomerKey, and SalesAmount.
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%207.png)
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%208.png)
    

- fact_budget (from spreadsheet) - represents budget information in each date.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%209.png)

<aside>
💡 `Notes` : "dim" is an abbreviation for "dimension”

</aside>

3.Export all the files and connect them to Power BI in order to create a dashboard

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/0914f8016627106395cef8d8f4c9a299b7ae0762/Projects/Sales%20Project/Picture/Untitled%2010.png)

Link to Power BI:

 [dashboard_project](https://app.powerbi.com/view?r=eyJrIjoiYzQxN2VhNTktYzA5MC00Yjk0LWEzMGQtNTI2ZDIwMzg1ZmE4IiwidCI6IjliYzU4NWY5LWE4YjgtNDMxYy05MDEzLWVmYTdiMmI0MGNkZiIsImMiOjEwfQ%3D%3D)

PDF file:

[dashboard_project.pdf](https://github.com/Chaphowasit4522/Portfolio/blob/7b99671982f7a23971d7a8c89663ddc32cbdec0e/Projects/Sales%20Project/Picture/dashboard_project.pdf)

The Sales Manager requested visual dashboards to improve internet sales reports, with a focus on sold products, clients, and sales over time, with filtering and budget comparison. The project used SQL Server Express and Azure SQL Server Management Studio to query data from five tables, including dim_date, dim_customer, dim_product, fact_internetsales, and fact_budget, and then exported them to Power BI to create a dashboard.

## Project Outcome:
The project will result in the creation of a set of visual dashboards hosted on Power BI. These dashboards will empower the sales team to gain valuable insights into product sales, customer behavior, historical trends, and budget performance. Users will have the flexibility to filter data based on specific criteria, enabling personalized analysis and decision-making. The project's success will contribute to data-driven sales strategies, enhanced performance tracking, and improved revenue growth.

## Project Deliverables:

-- Interactive visual dashboards hosted on Power BI.
-- Documentation and user guides for navigating and utilizing the dashboards.
-- PDF reports summarizing key findings and insights.
-- Data integration and export scripts for future data updates.
