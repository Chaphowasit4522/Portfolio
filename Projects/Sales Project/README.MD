# Sales Project

## ***business request***

Mark Steven - Sales Manager:
Hi Big!
I hope you are doing well. We need to improve our `internet sales reports` and want to move from static reports to `visual dashboards`.
Essentially, we want to focus it on how much we have `sold of what products` , to which clients and how `it has been over time`.
Seeing as each `sales person` works on different products and customers it would be beneficial to be able to `filter them also`.
We measure our numbers against `budget` so I added that in a `spreadsheet` so we can compare our values against performance.
The budget is for 2021 and we usually look `4 years back` in time when we do analysis of sales.
Let me know if you need anything else!

// Mark Steven

1. Using SQL Server Express as the database management system for my project . This choice allowed me to efficiently store and manage data while ensuring optimal performance. I decided to work with the AdventureWorks database, which provided a rich set of sample data to work with, enabling me to demonstrate my SQL skills effectively.

![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled.png)

1. To enhance the functionality of my project, I incorporated Azure SQL Server Management Studio (SSMS) into my workflow. With the help of SSMS, I efficiently queried files based on specific business requests. By utilizing the powerful querying capabilities of SSMS, I was able to extract and manipulate data to meet the unique requirements of each request.

We have selected `five` tables to use for this requirement. 

- dim_date - represents dates column. This table provides information about the date, including the month and year associated with each datekey.
    
    ![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%201.png)
    
    ![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%202.png)
    
- dim_customer - represents information about customers like unique customer key, name, gender, date of purchase, and city.
    
    ![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%203.png)
    
    ![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%204.png)
    
- dim_product - represents information about each product, including a unique product key, the name of the product, the sub-category it belongs to, and additional attributes that describe the product in more detail.
    
    ![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%205.png)
    
    ![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%206.png)
    
- fact_internetsales - represents numerical facts related to internet sales. It includes the following numeric columns: ProductKey, OrderDateKey, CustomerKey, and SalesAmount.
    
    ![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%207.png)
    
    ![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%208.png)
    

- fact_budget (from spreadsheet) - represents budget information in each date.

![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%209.png)

<aside>
💡 `Notes` : "dim" is an abbreviation for "dimension”

</aside>

3.Export all the files and connect them to Power BI in order to create a dashboard

![Untitled](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/Untitled%2010.png)

Link to Power BI:

 [dashboard_project](https://app.powerbi.com/view?r=eyJrIjoiYzQxN2VhNTktYzA5MC00Yjk0LWEzMGQtNTI2ZDIwMzg1ZmE4IiwidCI6IjliYzU4NWY5LWE4YjgtNDMxYy05MDEzLWVmYTdiMmI0MGNkZiIsImMiOjEwfQ%3D%3D)

PDF file:

[dashboard_project.pdf](Sales%20Project%20c83cf287976b4934afe85e227d8d6829/dashboard_project.pdf)

The Sales Manager requested visual dashboards to improve internet sales reports, with a focus on sold products, clients, and sales over time, with filtering and budget comparison. The project used SQL Server Express and Azure SQL Server Management Studio to query data from five tables, including dim_date, dim_customer, dim_product, fact_internetsales, and fact_budget, and then exported them to Power BI to create a dashboard.
