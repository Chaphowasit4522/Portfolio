# Mage.ai Data Processing for NYC_2019 Data :airplane:

## Introduction
The NYC_2019 Data Pipeline Project is an initiative to harness the power of data by processing the NYC_2019 dataset obtained from Kaggle using Mage.ai. This project aims to clean, transform, and analyze the dataset, ensuring data accuracy and completeness. By leveraging Mage.ai's flexible data processing capabilities, we will create an efficient pipeline that automates data cleaning and transformation tasks. Our goal is to prepare the data for in-depth analysis, enabling us to derive valuable insights from the AB_NYC_2019 dataset.

## Data Description
The NYC_2019 dataset, sourced from Kaggle, provides comprehensive information about listing activity and metrics in New York City for the year 2019. It encompasses various aspects of Airbnb listings, including host details, geographical availability, and essential metrics for predictive modeling and decision-making. The dataset contains multiple columns, each providing valuable insights into the Airbnb rental market in NYC.

You can download `AB_NYC_2019.csv` from Kaggle ===>
[AB_NYC_2019 | Kaggle](https://www.kaggle.com/code/jameshjkang/ab-nyc-2019)

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled.png)

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%201.png)

## Technologies & Tools
1. **Mage.ai**: Mage.ai serves as the central platform for building and executing the data pipeline, facilitating data loading, cleaning, and transformation. <br>
2. **Python**: Python programming language is used for data manipulation, transformation, and analysis.<br>
3. **Pandas**: Pandas is employed for data manipulation and transformation tasks.<br>
4. **Kaggle**: The initial dataset is sourced from Kaggle, a popular platform for data science and machine learning datasets.<br>

## Processes

1. Upload it to “Mage.ai” in the data loader section.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%202.png)

- data loader section

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%203.png)

- change it into dataframe.

1. I was exploring the data and discovered that there are incorrect data types for some columns and also found some rows with missing values. I will first clean the dataset by performing type checks and checking for missing values. During this process, I identified that the 'last_review' column should be of date type but is currently a string. I will convert it to the appropriate date format. Additionally, the 'reviews_per_month' column is of float type, but some values are missing. I will handle these missing values by imputing them with a constant value of zero.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%204.png)

- check null and check type.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%205.png)

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%206.png)

- convert type and fill null.

1. You can create visualizations at different stages of the process, such as visualizing data in the loader section, visualizing transformations in the transform section, and creating visualizations for exported results in the export section. I can provide an example if needed.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%207.png)

- Find “Which room type is the most popular choice among renters?”

1. I will double-check for null values to ensure data completeness, and then export the dataset to a local location.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%208.png)

#This is overall data lineage

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%209.png)

In [Mage.ai](http://mage.ai/), you have the flexibility to customize your data pipeline by dividing it into separate sections and connecting them independently, allowing for a tailored data processing workflow !!!!

## Project Overview
This project aims to streamline the data processing workflow for the NYC_2019 dataset using Mage.ai. It ensures data accuracy and completeness by handling null data, incorrect data types, and outliers. Visualizations are generated to aid in understanding the dataset at various stages of the pipeline. As an example, we explore the most popular room type among renters using visualizations and data analysis techniques.

## Summary
The NYC_2019 Data Pipeline Project is a data processing endeavor that leverages Mage.ai's capabilities to clean, transform, and analyze the NYC_2019 dataset from Kaggle. By adhering to a structured workflow, we ensure that the dataset is ready for in-depth analysis, empowering data-driven decision-making. This project demonstrates the power of flexible data pipelines in extracting valuable insights from complex datasets, ultimately contributing to a better understanding of the NYC Airbnb rental market in 2019.
