# Mage.ai Data Processing for NYC_2019 Data

This project aims to create a data pipeline using [Mage.ai](http://mage.ai/) to process NYC_2019 data, cleaning, transforming, and exporting it to a CSV file for analysis. The pipeline handles null data, wrong-format data, and outliers to ensure accuracy. The dataset is checked for null values and exported to a local location. Visualizations can be created at different stages of the process, and an example is provided for finding the most popular room type among renters.

1. Download `AB_NYC_2019.csv` from Kaggle

This dataset describes the **listing activity** and metrics in NYC, NY for 2019. Content This data file includes all needed information to find out more about hosts, geographical availability, necessary metrics to make predictions and draw conclusions.

[AB_NYC_2019 | Kaggle](https://www.kaggle.com/code/jameshjkang/ab-nyc-2019)

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled.png)

- Kaggle

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/afac1cc5d490a40931c916d3fdc6015a586662aa/Projects/AB_NYC_2019/Picture/Untitled%201.png)

- all columns

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
