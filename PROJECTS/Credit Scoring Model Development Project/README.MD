# Credit Scoring Model Development Project

# Introduction

We will explore a comprehensive credit scoring project for a fictional client, '**BIGGY** Bank.' Our goal is to help **BIGGY** Bank make data-driven lending decisions for subprime mortgages, a type of loan granted to individuals with poor credit scores. We will use a logistic regression classifier and the decile methodology to formulate a lending strategy.

![Introduction](Credit%20Scoring%20Model%20Project%5BUntitled%5D)

# **Data Description**

The dataset provided by **BIGGY** Bank contains 30 variables and around 3000 observations. The target variable is binary, with 0 representing `good loans` and 1 representing `bad loans`. Some of the key independent variables include bankruptcy indicator, public derogatories, financial inquiries, and trade lines. We will not consider the customer ID variable in our analysis for privacy.

![Data Description 1](Credit%20Scoring%20Model%20Project%5BUntitled%201%5D)

![Data Description 2](Credit%20Scoring%20Model%20Project%5BUntitled%202%5D)

# **Technologies & Tools**

The project utilizes machine learning and data analysis tools and techniques. It includes:

1. Logistic Regression: To build a predictive model for credit scoring.
2. Google Colab: For code development.
3. PySpark and Pandas: The programming language used for analysis.
4. Scikit-Learn: To perform data preprocessing and model building.
5. Decile Methodology: To formulate a lending strategy based on model predictions.

![Technologies & Tools](Credit%20Scoring%20Model%20Project%5BUntitled%203%5D)

# **Data Flow & Diagram**

The data flows from the dataset provided by **BIGGY** Bank through various preprocessing and model-building steps in the Google Colab. Model predictions and analysis will be exported for further use in formulating the lending strategy.

![Data Flow & Diagram](Credit%20Scoring%20Model%20Project%5BUntitled%204%5D)

# **Project Overview**

**BIGGY** Bank aims to maximize its profit while considering market expansion. They have shared historical customer data, which includes credit bureau records and the outcomes of previous loans. The bank has provided details of profits on good loans ($100) and losses on bad loans ($500). Our task is to build a risk model that helps **BIGGY** Bank make lending decisions based on data.

![Project Overview](Credit%20Scoring%20Model%20Project%5BUntitled%5%5D)

# **Process**

1. Data Preprocessing:
    - Import Spark and PySpark into Python
    
    ![Data Preprocessing 1](Credit%20Scoring%20Model%20Project%5BUntitled%6%5D)
    
    ![Data Preprocessing 2](Credit%20Scoring%20Model%20Project%5BUntitled%7%5D)
    
    ![Data Preprocessing 3](Credit%20Scoring%20Model%20Project%5BUntitled%8%5D)
    
    ![Data Preprocessing 4](Credit%20Scoring%20Model%20Project%5BUntitled%9%5D)
    
    - Import all the necessary libraries and profile a brief overview of the dataset.
    
    ![Data Preprocessing 5](Credit%20Scoring%20Model%20Project%5BUntitled%10%5D)
    
    - Check for missing values and impute them with appropriate measures (mean).
    
    ![Data Preprocessing 6](Credit%20Scoring%20Model%20Project%5BUntitled%11%5D)
    
    ![Data Preprocessing 7](Credit%20Scoring%20Model%20Project%5BUntitled%12%5D)
    
    - Split the data into 80:20 (training:test set).
    
    ![Data Preprocessing 8](Credit%20Scoring%20Model%20Project%5BUntitled%13%5D)
    
    - Standardize the data using StandardScaler from Scikit-Learn.
    
    ![Data Preprocessing 9](Credit%20Scoring%20Model%20Project%5BUntitled%14%5D)

2. Model Building:
    - Train a logistic regression model on the training set.
    
    ![Model Building](Credit%20Scoring%20Model%20Project%5BUntitled%15%5D)
    
    - Assess the model's performance on the test set (approximately about 83% accuracy).
    
    ![Model Building 2](Credit%20Scoring%20Model%20Project%5BUntitled%16%5D)
    
    - Export the model file and model predictions.
    
    ![Model Building 3](Credit%20Scoring%20Model%20Project%5BUntitled%17%5D)

3. Decile Methodology:
    - Apply decile methodology to categorize the data into 10 equal parts (600 rows in test set were split into 10 parts) based on descending probability of good loans.
    
    ![Decile Methodology](Credit%20Scoring%20Model%20Project%5BUntitled%18%5D)
    
    - Create an analysis table to determine the business rules for accepting or rejecting loan applications by calculating profitability across deciles using a formula: (Cumulative Good * Profit from Good Loan) - (Cumulative Bad * Loss from Bad Loan).
    
    ![Decile Methodology 2](Credit%20Scoring%20Model%20Project%5BUntitled%19%5D)

4. Formulating the Lending Strategy:
    - Identify the decile where the business maximizes its profit and set a cutoff probability.
    - Consider market expansion by exploring lower deciles with reduced cutoff probabilities.
    
    ![Lending Strategy](Credit%20Scoring%20Model%20Project%5BUntitled%20%5D)

    - ROC stands for "Receiver Operating Characteristic." The ROC curve is a graphical representation that helps to evaluate the performance of a binary classification model. It is a plot of the true positive rate (sensitivity or recall) against the false positive rate (1-specificity) for different classification thresholds.
    
    ![Lending Strategy 2](Credit%20Scoring%20Model%20Project%5BUntitled%21%5D)

# Observation

I have two versions of code: one in Python and the other in PySpark. I've also installed the **`ipython-autotime`** extension to calculate the runtime of each cell. Through my observations, I've noticed that for a dataset with 300
