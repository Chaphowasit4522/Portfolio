import pandas as pd

# Read the CSV file into a DataFrame
df = pd.read_csv("/workspaces/data-engineering-bootcamp/07-end-to-end-project/dags/movements-2023-09-08.csv")

# Get the number of rows
num_rows = df.shape[0]

print("Number of rows:", num_rows)
