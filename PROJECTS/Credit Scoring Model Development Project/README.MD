# Credit Scoring Model Development Project 💳

Reference : https://medium.com/@skillcate/credit-scoring-project-using-logistic-regression-c1e88bd7cf25

# Introduction

We will explore a comprehensive credit scoring project for a fictional client, '**BIGGY** Bank.' Our goal is to help **BIGGY** Bank make data-driven lending decisions for subprime mortgages, a type of loan granted to individuals with poor credit scores. We will use a logistic regression classifier and the decile methodology to formulate a lending strategy.

![Introduction](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled.png)

# **Data Description**

The dataset provided by **BIGGY** Bank contains 30 variables and around 3000 observations. The target variable is binary, with 0 representing `good loans` and 1 representing `bad loans`. Some of the key independent variables include bankruptcy indicator, public derogatories, financial inquiries, and trade lines. We will not consider the customer ID variable in our analysis for privacy.

![Data Description 1](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%201.png)

![Data Description 2](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%202.png)

# **Technologies & Tools**

The project utilizes machine learning and data analysis tools and techniques. It includes:

1. Logistic Regression: To build a predictive model for credit scoring.
2. Google Colab: For code development.
3. PySpark and Pandas: The programming language used for analysis.
4. Scikit-Learn: To perform data preprocessing and model building.
5. Decile Methodology: To formulate a lending strategy based on model predictions.

# **Data Flow & Diagram**

The data flows from the dataset provided by **BIGGY** Bank through various preprocessing and model-building steps in the Google Colab. Model predictions and analysis will be exported for further use in formulating the lending strategy.

![Technologies & Tools](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%203.png)

# **Project Overview**

**BIGGY** Bank aims to maximize its profit while considering market expansion. They have shared historical customer data, which includes credit bureau records and the outcomes of previous loans. The bank has provided details of profits on good loans ($100) and losses on bad loans ($500). Our task is to build a risk model that helps **BIGGY** Bank make lending decisions based on data.

![Project Overview](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%204.png)

# **Process**

1. Data Preprocessing:
    - Import Spark and PySpark into Python
    
    ![Data Preprocessing 1](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%205.png)
    
    ![Data Preprocessing 2](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%206.png)
    
    ![Data Preprocessing 3](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%207.png)
    
    ![Data Preprocessing 4](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%208.png)
    
    - Import all the necessary libraries and profile a brief overview of the dataset.
    
    ![Data Preprocessing 5](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%209.png)
    
    - Check for missing values and impute them with appropriate measures (mean).
    
    ![Data Preprocessing 6](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2010.png)
    
    ![Data Preprocessing 7](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2011.png)
    
    ![Data Preprocessing 8](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2012.png)
    
    - Split the data into 80:20 (training:test set).
    
    ![Data Preprocessing 9](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2013.png)
    
    - Standardize the data using StandardScaler from Scikit-Learn.
    
    ![Data Preprocessing 10](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2014.png)
    
2. Model Building:
    - Train a logistic regression model on the training set.
    
    ![Model Building](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2015.png)
    
    - Assess the model's performance on the test set (approximately about 83% accuracy).
    
    ![Model Building 2](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2016.png)
    
    - Export the model file and model predictions.
    
    ![Model Building 3](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2017.png)
    
3. Decile Methodology:
    - Apply decile methodology to categorize the data into 10 equal parts (600 rows in test set were split into 10 parts) based on descending probability of good loans.
    
    ![Decile Methodology](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2018.png)
    
    - Create an analysis table to determine the business rules for accepting or rejecting loan applications by calculating profitability across deciles using a formula: (Cumulative Good * Profit from Good Loan) - (Cumulative Bad * Loss from Bad Loan).
    
    ![Decile Methodology 2](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2019.png)
    
4. Formulating the Lending Strategy:
    - Identify the decile where the business maximizes its profit and set a cutoff probability.
    - Consider market expansion by exploring lower deciles with reduced cutoff probabilities.
    
    ![Lending Strategy](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2020.png)
    
    - ROC stands for "Receiver Operating Characteristic." The ROC curve is a graphical representation that helps to evaluate the performance of a binary classification model. It is a plot of the true positive rate (sensitivity or recall) against the false positive rate (1-specificity) for different classification thresholds.
    
    ![Lending Strategy 2](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2021.png)
    

# Observation

I have two versions of code: one in Python and the other in PySpark. I've also installed the **`ipython-autotime`** extension to calculate the runtime of each cell. Through my observations, I've noticed that for a dataset with 3000 rows, Pandas is more efficient than PySpark. However, I believe that PySpark's true potential lies in handling larger datasets, given its distributed processing capabilities. Therefore, my hypothesis is that as the size of the data grows, the efficiency and performance advantages of PySpark over Python will become more evident.

To put it another way, when dealing with smaller datasets, the simplicity and in-memory processing capabilities of Pandas make it a more efficient choice. But as data scales up, PySpark's ability to distribute the workload across a cluster of machines can lead to improved performance and scalability, making it a more suitable option for handling big data.

# Model Documentation
I have meticulously crafted a detailed model documentation in this project to ensure that every aspect of our credit scoring model, developed with logistic regression, is thoroughly explained and readily accessible.

## Example contents in document

**Introduction and Overview:** An initial look at the purpose and scope of this documentation.

**Data Source:** Information about the origin of the dataset used in this model.

**Data Preprocessing:** How the data was cleaned, prepared, and transformed for analysis.

**Model Details:** A deep dive into the specifics of the logistic regression model, including hyperparameters and assumptions.

**Data Summary:** A brief overview of the dataset's size and structure.

**Handling Missing Values:** An explanation of how missing data was managed during preprocessing.

**Data Splitting:** Details on how the dataset was divided into training and testing sets.

**Feature Standardization:** The process of standardizing features for modeling.

**Exporting Normalization Coefficients:** Saving the scaling factors for future predictions.

**Model Training:** Insights into the training process of the logistic regression model.

**Exporting Model:** How the trained model was saved for later use.

**Model Evaluation:** Performance metrics like the confusion matrix and accuracy score for model assessment.

**Probability Predictions:** Understanding the generation of probability predictions.

**Model Output File:** The output file containing predictions and actual outcomes.

**Conclusion:** Summarizing the model development and its potential applications.

**Future Enhancements:** Suggestions for improving the model, such as exploring advanced machine learning techniques and implementing real-time scoring and monitoring.

# Summary

![Summary](https://github.com/Chaphowasit4522/Portfolio/blob/0de6545af035fd2d2241a1b96fa6d6f9a8f492b7/PROJECTS/Credit%20Scoring%20Model%20Development%20Project/Pictures/Untitled%2022.png)

**Final Recommendations:**

1. **Keeping Only Profitability in Mind:** This recommendation suggests that loan applications should be approved if the probability for the target variable (which might represent loan default or another relevant outcome) being 0 (representing a "good" loan) is higher than 85.47%. In other words, prioritize approving loans that have a high probability of being repaid (good loans) to maximize profitability.
2. **Keeping Profitability & Expansion in Mind:** This recommendation takes both profitability and expansion into account. It suggests approving loan applications if the probability for the target variable being 0 is higher than 79.73%. This slightly lower threshold might be a balance between profitability and a desire to expand the number of approved loans, potentially reaching a broader customer base.

In conclusion, this credit scoring project provides **BIGGY** Bank with a data-driven risk model to make lending decisions for subprime mortgages. The lending strategy is designed to help the bank maximize profits while considering market expansion. The analysis suggests options for the bank to prioritize profitability or market share based on their business objectives. Ultimately, this data-driven approach empowers **BIGGY** Bank to make informed lending decisions in a complex and dynamic financial landscape.
