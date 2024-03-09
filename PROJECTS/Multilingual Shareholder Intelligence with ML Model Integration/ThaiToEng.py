import mysql.connector
import pandas as pd
import numpy as np
import re
from deep_translator import GoogleTranslator

def contains_thai(text): # check for thai word in the name
    thai_pattern = re.compile(r'[\u0E00-\u0E7F]+')  # Thai unicode range
    return bool(re.search(thai_pattern, text))

def translate_to_english(row): # translate TH to ENG
    text = row['Major_Shareholders']
    if contains_thai(text):
        translated_text = GoogleTranslator(source='th', target='en').translate(text)
        if translated_text != text:  # Check if the translation occurred
            print("Success row ID:", row['id'])  # Print the row ID if translated
        return translated_text
    return text

# Connect to the MySQL database
mydb = mysql.connector.connect(
    host="*************",
    user="*************@kip",
    password="*************",
    database="*************"
)
mycursor = mydb.cursor()

# Execute the SQL query to fetch 100 rows from the 'shareholders' table
sql = """SELECT id , Major_Shareholders FROM `shareholders` LIMIT 10000 """
mycursor.execute(sql)

# Fetch all the rows from the result set
result = mycursor.fetchall()
columns = [i[0] for i in mycursor.description]  # Extract column names
df = pd.DataFrame(result, columns=columns)

# Translate
thai_df = df[df['Major_Shareholders'].apply(lambda x: contains_thai(x))] # extract only Thai text rows
thai_df['Major_Shareholders_English'] = thai_df.apply(translate_to_english, axis=1) # translate TH to EN
print(thai_df.head(100))
print(thai_df.shape)

# Splitting the DataFrame into 5 segments
split_df = np.array_split(thai_df, 5)

# Save each segment to a separate JSON file
for i, segment in enumerate(split_df):
    segment.to_json(f'web service\data_{i + 1}.json', orient='records')

# Close the cursor and database connection
mycursor.close()
mydb.close()
