from flask import Flask, jsonify, render_template
from flask import request
import pandas as pd
import mysql.connector
import json


app = Flask(__name__)

# set connection to mysql
servername = "*************"
username = "*************"
password = "*************"
dbname = "*************"

mydb = mysql.connector.connect(
    host=servername,
    user=username,
    password=password,
    database=dbname
)

# create website
@app.route('/html/<int:page_number>')
def display_data(page_number):
    try:
        file_path = f'web service\\data_{page_number}.json'
        df = pd.read_json(file_path) # receive data from json by use page_number   
        return render_template(f'data_{page_number}.html', data=df.to_html()) # open website http://127.0.0.1:5000/html/{page_number}   
    except FileNotFoundError:
        return jsonify({'status': 'error', 'message': 'Page not found'})
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)})

# insert data into mysql
@app.route('/insert_data', methods=['POST'])
def insert_data():
    if request.method == 'POST':
        try:
            data = request.json 
            print("Received data:", data)
            
            id_value = int(data[0])  # id
            major_shareholders = data[1]  # Major_Shareholders
            major_shareholders_english = data[2]  # Major_Shareholders_English 

            cursor = mydb.cursor()
            sql = "INSERT INTO shareholders (id, Major_Shareholders, Major_Shareholders_English) VALUES (%s, %s, %s)"
            cursor.execute(sql, (id_value, major_shareholders, major_shareholders_english)) # insert into db
            mydb.commit()
            cursor.close()
            return jsonify({'status': 'success', 'message': 'Data inserted successfully'})
        except Exception as e:
            return jsonify({'status': 'error', 'message': str(e)})
        
# delete data in json
@app.route('/delete_data', methods=['POST'])
def delete_data():
    if request.method == 'POST':
        try:
            all_data = request.json  # Data received from the frontend
            print("deleted data:", all_data)

            data = all_data.get('rowData')  # Get data from the received JSON
            page_number = all_data.get('page_number') # Get page_number from the received JSON
            print("data:", data)
            print("page num:", page_number)
            # Read the data.json file
            with open(f'web service\data_{page_number}.json', 'r') as json_file:
                data_json = json.load(json_file)
            # Remove the row based on the received data
            updated_data = [row for row in data_json if row['id'] != int(data[0])]  # Assuming 'id' is the key for identification
            # Write the updated data back to data.json
            with open(f'web service\data_{page_number}.json', 'w') as json_file:
                json.dump(updated_data, json_file, indent=4)
            return jsonify({'status': 'success', 'message': 'Data deleted successfully from JSON'})
        except Exception as e:
            return jsonify({'status': 'error', 'message': str(e)})

# main
if __name__ == '__main__':
    app.run(debug=True)