# Automated Data Pipeline & Data Flow in Azure

!!!!:rotating_light: This project involves credentialing, and everything within it is simulated :rotating_light:!!!!

## Introduction

In the era of data-driven decision-making, efficient data management is paramount. My project, "**Automated Data Pipeline & Data Flow in Azure**" is a robust solution designed to streamline and enhance the entire data pipeline process. This project empowers organizations to harness the full potential of their data by automating critical tasks, ensuring data accuracy, and optimizing data flows.

## Data Description

"The table at hand is a comprehensive compilation of diverse banking and financial data, covering a wide array of crucial domains and operations. It includes the following data categories:

1. **Loan Data:** This section includes detailed information on loans, such as loan types, terms, interest rates, and borrower profiles. It tracks loan applications, disbursements, repayments, and outstanding balances.
2. **Credit Card Data:** Similar to loans, this segment focuses on credit card-related information, including cardholder details, transaction histories, credit limits, and billing records.
3. **Approval History:** This dataset captures the history of approval and denial decisions for loans, credit card applications, or other financial products. It logs approval timestamps, reasons for approval or rejection, and the responsible decision-makers.
4. **Approval Requests:** Information about incoming requests for loan approvals, credit card applications, or other financial services. It contains applicant details, requested amounts, and submission timestamps.
5. **Job Area:** This section provides insights into the employment and occupational data of customers, helping to assess income stability and creditworthiness.
6. **Contract Details:** Data related to contractual agreements, terms, and conditions for loans, credit cards, or other financial products. It includes contract start and end dates, clauses, and obligations.
7. **Day-End Status:** A record of daily financial operations, including account balances, transaction summaries, and reconciliation data.
8. **Score Mapping:** This dataset maps credit scores or risk assessments to specific customers or applications, aiding in credit risk evaluation.
9. **Vehicle Information:** Information about vehicles owned by customers, including vehicle types, ownership status, and associated financial obligations.
10. **Document Sending:** Logs related to the sending and receiving of financial documents, such as statements, contracts, or notifications.
11. **Risk Scores:** This dataset computes and tracks risk scores associated with customers or financial transactions, facilitating risk management and fraud detection.
12. **Lead Status and KPIs:** Monitoring and tracking the progress and performance of leads, sales, or marketing efforts using key performance indicators (KPIs).
13. **Owner Logging:** Records of customer interactions, communications, and account management activities by authorized personnel or account owners.
14. **Direct Debit:** Information on direct debit authorizations and transactions, ensuring timely payments and financial commitments.
15. **Voluntary Insurance:** Data related to voluntary insurance policies held by customers, including policy types, coverage, and premiums.

In the past two months, I have successfully migrated approximately 100 data tables, with each batch typically consisting of around 30 tables. But I will explain just 15 tables.

## Technologies & Tools

- **Azure Data Factory:** for orchestrating and automating data pipelines.
- **Microsoft SQL Server Management Studio (SSMS):** for SQL file generation and database management.
- **Azure Blob Storage:** for storing raw data before processing.
- **Azure Databricks:** for data preprocessing and consolidation.
- **Azure Synapse Analytics:** for delivering insights to end-users.
- **Microsoft SQL Database:** for data storage and retrieval.
- **Oracle Database:** for specific data transmission scenarios
- **Microsoft Excel (with Macros):** for converting document files into JSON format.
- **Sharepoint** **:** for creating and manipulating document files.
- **SQL Server Management Studio:** for SQL file generation and database management.
- **JSON:** for data interchange and data dictionary creation.
- **Logging and Monitoring Tools:** for tracking data pipeline performance and debugging.
- **Company's Central Configuration:** for centralizing and sharing project configurations and settings.

## Data Flow & Diagram

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/5fe3e81debfe47b1558d334993f0ba1ccb002314/Projects/Automated%20Data%20Pipeline%20%26%20Data%20Flow%20in%20Azure/Pictures/Diagrams.png)

## Project Overview

Our project encompasses several key components to create a comprehensive data management ecosystem:

1. **Automated Environment Configuration:** We have developed a seamless process to set up development (DEV), system integration testing (SIT), and user acceptance testing (UAT) environments. This ensures that data pipeline operations are consistent across different stages of development and testing.
2. **Data Ingestion:** We have established efficient data ingestion processes that collect raw data and define the file format, structure, and storage location for CSV files. This step ensures that data from various sources is collected and organized for further processing.
3. **Scheduled Data Pipeline:** To maintain a consistent and up-to-date data flow, we've implemented scheduling and trigger mechanisms. This automates the initiation of data pipelines at predefined intervals, ensuring that your data is always current and available for analysis.
4. **Routine Maintenance and Monitoring:** Our solution includes routine maintenance and monitoring tasks such as verifying data sources, updating dependencies, and optimizing performance. This proactive approach helps prevent issues and ensures the smooth operation of your data pipelines.
5. **Error Handling and Data Cleansing:** We've integrated robust error handling mechanisms to identify and address pipeline failures promptly. Additionally, data cleansing techniques are employed to guarantee data accuracy, completeness, and consistency throughout the pipeline.
6. **Data Transformation:** Our project takes raw data extracted from SQL databases and stages it in Azure Blob Storage. Data is then consolidated with third-party tables in Azure Databricks, setting the stage for advanced analytics. Insights are delivered to end-users via Azure Synapse Analytics, empowering data scientists, data analysts, and other units to derive actionable insights.

By automating these essential data management processes, our project enables organizations to focus on data analysis and decision-making rather than the complexities of data integration and transformation.

# Processes

1. Assess the business requirements and determine the appropriate pipeline type, one could consider employing different strategies. For instance,
    - Pipeline Type 38 might be the preferred option for transmitting data seamlessly from Oracle databases to the company's data platform, leveraging its specific capabilities for this data source.
    - Conversely, for the scenario of transferring data from on-premise servers to the data platform, Pipeline Type 40 could be the more suitable choice, taking into account its functionality tailored to such server-to-platform integration needs.
    
    In essence, a nuanced evaluation of the business needs will enable us to make an informed decision regarding the optimal pipeline type selection for each distinct data transmission scenario
    

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/da6f2f45309f66f118d80815d65f00db3e011620/Projects/Automated%20Data%20Pipeline%20%26%20Data%20Flow%20in%20Azure/Pictures/Untitled.png)

2. Configure a data stream that will enable the transfer of data from a source in Microsoft SQL database by using Microsoft SQL Server Management Studio. This stream should include metadata such as the date, process ID, process group, dependencies, target table name, schema name, and other relevant information. This data will be inserted into the database and utilized by Azure Data Factory for execution

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/6027faa8bb2199a58197fc2e02700d9637c1db16/Projects/Automated%20Data%20Pipeline%20%26%20Data%20Flow%20in%20Azure/Pictures/Untitled%201.png)

3. We have selected a type then we will generate document files in the .xlsx format and then use macros to convert them into JSON format. These JSON files will be used to create a data dictionary that will be placed in a path for Azure Data Factory to utilize in running this pipeline

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/6027faa8bb2199a58197fc2e02700d9637c1db16/Projects/Automated%20Data%20Pipeline%20%26%20Data%20Flow%20in%20Azure/Pictures/Untitled%202.png)

4. Create an SQL file that selects the desired columns, adds a new 'Date_dt' column to indicate the date of data movement, and then saves the result to a path accessible by Azure Data Factory

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/6027faa8bb2199a58197fc2e02700d9637c1db16/Projects/Automated%20Data%20Pipeline%20%26%20Data%20Flow%20in%20Azure/Pictures/Untitled%203.png)

5. Run the data pipeline and monitor it. If it fails, we will debug it by watching the logs and correct it. If it succeeds, we will check whether the data exists in both the data lake and the data warehouse.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/6027faa8bb2199a58197fc2e02700d9637c1db16/Projects/Automated%20Data%20Pipeline%20%26%20Data%20Flow%20in%20Azure/Pictures/Untitled%204.png)

6. Create a table on Azure Databricks to underlie it, and then create a script for creating a view on Azure Synapse Analytics. But it is a manual operation, that make me must do an extra project.

## Extra Project
In this extra project, I am developing a notebook that leverages automation techniques to automatically create views on Azure Synapse Analytics by referencing a notebook that generates creating tablr script on Azure Databricks. This automation will be achieved by detecting the data schema from a JSON file, as mentioned earlier.

The automation notebook utilizes Pyspark, a powerful tool for data manipulation and transformation, to dynamically generate the necessary script for creating views on Azure Synapse Analytics. This approach not only saves valuable time but also minimizes the risk of human error when defining data structures. 

By combining the manual operation of creating views in Azure Synapse Analytics with this supplementary automation project, I aim to create a comprehensive solution that offers both flexibility and efficiency in managing data transformations and reporting. This approach ensures that our data pipeline is robust, adaptable, and capable of handling evolving data schemas, ultimately contributing to improved data analysis and decision-making processes.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/067973b0bb3d14405f6d5f006ba759194f663867/Projects/Automated%20Data%20Pipeline%20%26%20Data%20Flow%20in%20Azure/Pictures/image%20(1).png)

7. If it succeeds and exists in both locations, create the unit test file to serve company employees in Sharepoint who want to understand what I have done. Afterward, move all configurations to the central company file

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/6027faa8bb2199a58197fc2e02700d9637c1db16/Projects/Automated%20Data%20Pipeline%20%26%20Data%20Flow%20in%20Azure/Pictures/Untitled%205.png)

# Summary

The "Automated Data Pipeline & Data Flow in Azure" project streamlines and enhances the entire data pipeline process, empowering organizations to harness the full potential of their data. The project includes automated environment configuration, efficient data ingestion processes, scheduled data pipelines, routine maintenance and monitoring, error handling and data cleansing, and data transformation. The extra project involves automation techniques to automatically create views on Azure Synapse Analytics, contributing to improved data analysis and decision-making processes.
