# End-To-End Project with GCP 🌎

# Background

As a Lead Data Engineer who was recently hired at a railway company. The problem we have been assigned is to develop a Data Analytics Platform in order to use data from NetworkRail to analyze the efficiency of train operations in order to find various shortcomings as well as guidelines for further improvement.

We use Train Movement data from [Network Rail Company](https://datafeeds.networkrail.co.uk/). We can see a description of each field of data at [Network Rail Data](https://wiki.openraildata.com/index.php?title=Train_Movement) . This data will be continuously stored in Postgres. We can view the actual data on the `SQLPad` UI page as shown below.

```python
URL: http://34.87.139.82:3000
Username: ***************** (credential)
Password: ***************** (credential)
```

# Data Description

A train movement message is sent whenever a train arrives, passes or departs a location monitored by TRUST. It records the time at which the event happens. Reports may be automatically generated, or manually entered.

## Data structure

```
{
	"header": {
		"msg_type": "0003",
		"source_dev_id": "VLA5",
		"user_id": "#QHPA026",
		"original_data_source": "SDR",
		"msg_queue_timestamp": "1511528232000",
		"source_system_id": "TRUST"
	},
	"body": {
		"event_type": "DEPARTURE",
		"gbtt_timestamp": "",
		"original_loc_stanox": "",
		"planned_timestamp": "1511524620000",
		"timetable_variation": "0",
		"original_loc_timestamp": "",
		"current_train_id": "",
		"delay_monitoring_point": "true",
		"next_report_run_time": "9",
		"reporting_stanox": "52701",
		"actual_timestamp": "1511524620000",
		"correction_ind": "false",
		"event_source": "MANUAL",
		"train_file_address": null,
		"platform": "",
		"division_code": "79",
		"train_terminated": "false",
		"train_id": "515G531I24",
		"offroute_ind": "false",
		"variation_status": "ON TIME",
		"train_service_code": "25936005",
		"toc_id": "79",
		"loc_stanox": "52701",
		"auto_expected": "true",
		"direction_ind": "",
		"route": "",
		"planned_event_type": "DEPARTURE",
		"next_report_stanox": "52226",
		"line_ind": ""
	}
}
```

### **Header**

| Field | Description |
| --- | --- |
| msg_type | Set to '0003' for a movement message |
| source_dev_id | https://wiki.openraildata.com/index.php?title=LATA or https://wiki.openraildata.com/index.php?title=CICS_Session of the inputting terminal |
| user_id | https://wiki.openraildata.com/index.php?title=NCI_signon of the inputting user |
| source_system_id | Set to "TRUST" for a movement message |
| original_data_source | Set to "GPS", "SDR", "SMART", "TOPS" or "TRUST DA" for a movement message |
| msg_queue_timestamp |  |

### **Body**

Fields marked with an asterisk may not be present in some messages and your code should not assume they will always be populated.

| Field | Description |
| --- | --- |
| event_type | The type of event - either "ARRIVAL" or "DEPARTURE" |
| gbtt_timestamp* | The planned GBTT (passenger) date and time that the event was due to happen at this location |
| original_loc_stanox* | If the location has been revised, the STANOX of the location in the schedule at activation time |
| original_loc_timestamp* | The planned time associated with the original location |
| planned_timestamp | The planned date and time that this event was due to happen at this location |
| timetable_variation | The number of minutes variation from the scheduled time at this location. Off-route reports will contain "0" |
| current_train_id* | Where a train has had its identity changed, the current 10-character unique identity for this train |
| delay_monitoring_point | Set to "true" if this is a delay monitoring point, "false" if it is not. Off-route reports will contain "false" |
| next_report_run_time* | The running time to the next location |
| reporting_stanox* | The STANOX of the location that generated this report. Set to "00000" for manual and off-route reports |
| actual_timestamp | The date and time that this event happened at the location |
| correction_ind | Set to "false" if this report is not a correction of a previous report, or "true" if it is |
| event_source | Whether the event source was "AUTOMATIC" from SMART, or "MANUAL" from TOPS or TRUST SDR |
| train_file_address* | The TOPS train file address, if applicable |
| platform* | Two characters (including a space for a single character) or blank if the movement report is associated with a platform number |
| division_code | Operating company ID as per https://wiki.openraildata.com/index.php?title=TOC_Codes |
| train_terminated | Set to "true" if the train has completed its journey, or "false" otherwise |
| train_id | The 10-character unique identity for this train at TRUST activation time |
| offroute_ind | Set to "false" if this report is for a location in the schedule, or "true" if it is not |
| variation_status | One of "ON TIME", "EARLY", "LATE" or "OFF ROUTE" |
| train_service_code | Train service code as per schedule |
| toc_id | Operating company ID as per https://wiki.openraildata.com/index.php?title=TOC_Codes |
| loc_stanox | The STANOX of the location at which this event happened |
| auto_expected* | Set to "true" if an automatic report is expected for this location, otherwise "false" |
| direction_ind* | For automatic reports, either "UP" or "DOWN" depending on the direction of travel |
| route* | A number or blank to indicate the exit route from this location. A value of 'F' indicates the train failed to stop here |
| planned_event_type | The planned type of event - one of "ARRIVAL", "DEPARTURE" or "DESTINATION" |
| next_report_stanox* | The STANOX of the location at which the next report for this train is due |
| line_ind* | A single character (or blank) depending on the line the train is travelling on, e.g. F = Fast, S = Slow |

# Technologies & Tools

1. **Google Cloud Storage (GCS):** GCS is a cloud-based object storage service provided by Google Cloud Platform. It's used to store and manage the train movement data, which can be structured in buckets and objects.
2. **BigQuery:** Google BigQuery is a fully managed, serverless data warehouse that is used for analyzing large datasets in real-time. It's where you will load the train movement data from GCS for analysis.
3. **PostgreSQL:** While not explicitly mentioned in your project description, it appears you might be using PostgreSQL as an initial data store for your train movement data before transferring it to GCS and BigQuery.
4. **Airflow:** Apache Airflow is an open-source platform to programmatically author, schedule, and monitor workflows. You'll be using it to create and schedule data pipeline tasks, such as extracting data from PostgreSQL, loading it into GCS, and then into BigQuery.
5. **dbt (Data Build Tool):** dbt is a command-line tool and development environment for analytics engineering. It helps you transform data in your warehouse more effectively. You'll use it to create models and reports on top of your data.
6. **Looker:** Looker is a business intelligence and data analytics platform that allows you to create and share reports and dashboards for data exploration and visualization.
7. **SQLPad:** SQLPad is a web-based SQL editor to interact with databases. You mentioned using it for viewing actual data.
8. **Python:** Python is a versatile programming language commonly used in data engineering and data analysis tasks. You may use Python scripts to automate various parts of your data pipeline.
9. **Docker:** Docker is used for containerization and managing dependencies, making it easier to deploy and run applications consistently across different environments.

# Data Flow & Diagram

![DBT.png](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/DBT.png)

# Project Overview

The Data Analytics Platform for Network Rail Train Operations project aims to leverage advanced data analytics technologies and cloud-based solutions to transform raw train movement data into actionable insights. This will empower Network Rail to make informed decisions, enhance safety, and optimize the performance of their railway network. The project will be executed through a series of well-defined phases, with a multidisciplinary team working collaboratively to achieve the project objectives.

# Before We Start

before we start doing this project We might start by creating project and then create GCS Bucket and BigQuery first.

- I already using GCS Bucket called **`chaphowasit-project-network_rail`** in asia-southeast1 (Singapore) .

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled.png)

- At BigQuery we will create a new Dataset named `networkrail` to store Network Rail information.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%201.png)

- Run the command below to prepare for Airflow.

```python
mkdir -p ./dags ./config ./logs ./plugins ./tests ./dbt
echo -e "AIRFLOW_UID=$(id -u)" > .env
```

# Processes

In this project we will start by running Airflow using the command below.

```python
docker compose up --build
```

**The Data Pipeline that we will create will do the job**

- Load data from the Source System in Postgres Database.
- Store it in the GCS Bucket.
- Load data from files stored in GCS Bucket into BigQuery dataset.
- Set the schedule to Hourly so that we will have new information coming in continuously during the day.

Since we need to use Airflow to connect to the Postgres Database, we will create an Airflow Connection to store the credentials used to connect. 

```python
Connection ID: networkrail_postgres_conn
Schema: networkrail
Table: movements
Username: postgres
Password: ***************************
Host: *********
Port: 5435
```

Create DAG `dags/networkrail_movements_to_gcs_and_then_bigquery.py` for put in airflow then I write code for load data from postgres to gcs and gcs to bigquery by function .

```python
import csv
import json
import logging

from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import BranchPythonOperator, PythonOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.utils import timezone

from google.cloud import bigquery, storage
from google.oauth2 import service_account

DAGS_FOLDER = "/opt/airflow/dags"
BUSINESS_DOMAIN = "networkrail"
DATA = "movements"
LOCATION = "asia-southeast1"
PROJECT_ID = "YOUR_GCP_PROJECT_ID"
GCS_BUCKET = "YOUR_GCS_BUCKET"
BIGQUERY_DATASET = "networkrail"
KEYFILE_FOR_GCS = "YOUR_KEYFILE_PATH"
KEYFILE_FOR_GCS_TO_BIGQUERY = "YOUR_KEYFILE_PATH"

def _extract_data(**context):
    ds = context["data_interval_start"].to_date_string()

    # Your code here
    if True:
        return "load_data_to_gcs"
    else:
        return "do_nothing"

def _load_data_to_gcs(**context):
    ds = context["data_interval_start"].to_date_string()

    # Your code here

def _load_data_from_gcs_to_bigquery(**context):
    ds = context["data_interval_start"].to_date_string()

    # Your code here

default_args = {
    "owner": "Chaphowasit",
    "start_date": timezone.datetime(2023, 5, 1),
}
with DAG(
    dag_id="networkrail_movements_to_gcs_and_then_bigquery",
    default_args=default_args,
    schedule=None,  # Set the schedule here
    catchup=False,
    tags=["2023", "networkrail"],
    max_active_runs=3,
):

    # Start
    start = EmptyOperator(task_id="start")

    # Extract data from NetworkRail Postgres Database
    extract_data = EmptyOperator(task_id="extract_data")

    # Do nothing
    do_nothing = EmptyOperator(task_id="do_nothing")

    # Load data to GCS
    load_data_to_gcs = EmptyOperator(task_id="load_data_to_gcs")

    # Load data from GCS to BigQuery
    load_data_from_gcs_to_bigquery = EmptyOperator(task_id="load_data_from_gcs_to_bigquery")

    # End
    end = EmptyOperator(task_id="end", trigger_rule="one_success")

    # Task dependencies
    start >> extract_data >> load_data_to_gcs >> load_data_from_gcs_to_bigquery >> end
    extract_data >> do_nothing >> end
```

You can follow me by : 

1. Set the GCP Project ID, set the GCS Bucket name, set the BigQuery Dataset name, and set your own keyfile path.
2. Set the DAG schedule to run at every hour.
3. Let's see which tasks should be used. `PythonOperator` or `BranchPythonOperator` should be used. Change as appropriate.
4. Write code to develop functions `_extract_data` to extract the day's data from the Postgres Database and write the file to CSV, then use the Task in the DAG to call this function. When writing to the CSV file, we can use the Header information below.

```python
header = [
    "event_type",
    "gbtt_timestamp",
    "original_loc_stanox",
    "planned_timestamp",
    "timetable_variation",
    "original_loc_timestamp",
    "current_train_id",
    "delay_monitoring_point",
    "next_report_run_time",
    "reporting_stanox",
    "actual_timestamp",
    "correction_ind",
    "event_source",
    "train_file_address",
    "platform",
    "division_code",
    "train_terminated",
    "train_id",
    "offroute_ind",
    "variation_status",
    "train_service_code",
    "toc_id",
    "loc_stanox",
    "auto_expected",
    "direction_ind",
    "route",
    "planned_event_type",
    "next_report_stanox",
    "line_ind",
]
```

As a result of this step, we will have a CSV file that we saved, containing NetworkRail information.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%202.png)

1. Write code to develop functions `_load_data_to_gcs` To upload the CSV file from the previous section to GCS Bucket, then use the Task in the DAG to call this function. As a result of this step, we will see the CSV file we obtained from the previous step in our GCS Bucket.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%203.png)

1. Write code to develop functions `_load_data_from_gcs_to_bigquery` to allow BigQuery to load data from GCS to create a table, where our table will partition the `actual_timestamp` field. It's a daily basis, then let the Task in the DAG call this function. The code below can be used to load JobConfig.

```python
bigquery_schema = [
    bigquery.SchemaField("event_type", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("gbtt_timestamp", bigquery.enums.SqlTypeNames.TIMESTAMP),
    bigquery.SchemaField("original_loc_stanox", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("planned_timestamp", bigquery.enums.SqlTypeNames.TIMESTAMP),
    bigquery.SchemaField("timetable_variation", bigquery.enums.SqlTypeNames.INTEGER),
    bigquery.SchemaField("original_loc_timestamp", bigquery.enums.SqlTypeNames.TIMESTAMP),
    bigquery.SchemaField("current_train_id", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("delay_monitoring_point", bigquery.enums.SqlTypeNames.BOOLEAN),
    bigquery.SchemaField("next_report_run_time", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("reporting_stanox", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("actual_timestamp", bigquery.enums.SqlTypeNames.TIMESTAMP),
    bigquery.SchemaField("correction_ind", bigquery.enums.SqlTypeNames.BOOLEAN),
    bigquery.SchemaField("event_source", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("train_file_address", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("platform", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("division_code", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("train_terminated", bigquery.enums.SqlTypeNames.BOOLEAN),
    bigquery.SchemaField("train_id", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("offroute_ind", bigquery.enums.SqlTypeNames.BOOLEAN),
    bigquery.SchemaField("variation_status", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("train_service_code", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("toc_id", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("loc_stanox", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("auto_expected", bigquery.enums.SqlTypeNames.BOOLEAN),
    bigquery.SchemaField("direction_ind", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("route", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("planned_event_type", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("next_report_stanox", bigquery.enums.SqlTypeNames.STRING),
    bigquery.SchemaField("line_ind", bigquery.enums.SqlTypeNames.STRING),
]
job_config = bigquery.LoadJobConfig(
    skip_leading_rows=1,
    write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE,
    source_format=bigquery.SourceFormat.CSV,
    schema=bigquery_schema,
    time_partitioning=bigquery.TimePartitioning(
        type_=bigquery.TimePartitioningType.DAY,
        field="actual_timestamp",
    ),
)
```

The results obtained from this step We can see that in our BigQuery, the Dataset named `networkrail` has a table called `movements` occur that has Daily Partition in the `actual_timestamp` field. And there is train information in it.

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%204.png)

1. Please check the Airflow DAG name `networkrail_movements_to_gcs_and_then_bigquery` and review its graph that show all tasks

![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%205.png)

## Applying Analytics Engineering to Our Project using dbt

1. Now we will create a dbt project named `networkrail` under the `dbt` folder because the `dbt` folder was originally mounted to Airflow. This will make the files under this `dbt` folder accessible to Airflow.
    
    Before we can use dbt, we will first install the Python Packages `dbt-core` and `dbt-bigquery` using Poetry by running the command
    
    ```python
    poetry install
    ```
    
    **Note**: Commands from now on will always have `poetry run` in front of them. Because we use Poetry to manage various packages, but if we don't want to type this command in front of it every time, we can command `poetry shell`. Here it will be as if we are already in the Virtual Environment, allowing us to run Commands without the `poetry run` prefix are allowed.
    
    Once done, let us go into the `dbt` folder first and then create a dbt project.
    
    ```bash
    cd dbt
    poetry run dbt init
    ```
    
    - Name the project `networkrail`
    - select Database as `bigquery`.
    - As for the data used to connect to BigQuery that will be created in the file. `profiles.yml` allows us to fill in any information first (random information). Because in the next step we will create a file. `profiles.yml` itself
    
    We will create a `profile.yml` file following this code. Create this file in the dbt folder (not in the dbt networkrail project folder) and rename outputs, project, dataset, and keyfile to each one.
    
    ```yaml
    networkrail:
      target: dbt_YOUR_NAME
    
      outputs:
        dbt_zkan:
          type: bigquery
          method: service-account
          project: YOUR_GCP_PROJECT_ID
          dataset: dbt_YOUR_NAME
          threads: 1
          keyfile: YOUR_KEYFILE_PATH
          location: asia-southeast1
    
        prod:
          type: bigquery
          method: service-account
          project: YOUR_GCP_PROJECT_ID
          dataset: networkrail
          threads: 1
          keyfile: YOUR_KEYFILE_PATH
          location: asia-southeast1
    ```
    
    The reason why the file was created `profiles.yml` is kept outside of the dbt project here because when we use Astronomer Cosmos on Airflow to read the dbt project, if we have the `profiles.yml` file in the dbt project, Astronomer Cosmos will find it. Profile that we set in Connection cannot be found, so putting this file outside the project It will allow us to use dbt along with using Astronomer Cosmos on Airflow.
    
    Now when we run the dbt commands, let us first go into the dbt project folder named `networkrail` where we will set the path of the `profiles.yml` file by inserting `--profiles-dir` in it. Each dbt command, for example:
    
    ```yaml
    poetry run dbt debug --profiles-dir ..
    ```
    
    `..` means that it will be a folder above the dbt project folder again. Now we can run dbt on our machine.
    
    ### Creating Model Layers
    
    Before starting to create our Model Layers, let's delete the `example` folder in the `models` folder in our dbt project. In BigQuery, we will only have the models we created.
    
    In the file `dbt_project.yml` we will set the schema like this: Staging model, go to `_staging`, Intermediate model, go to create at `_intermediate` and the Mart model, go to `_reporting` and then Materialize every model we create as a View (in the future we can change it to a Table if we begin to have performance problems).
    
    ```yaml
    ...
    
    models:
      networkrail:
        staging:
          networkrail:
            +materialized: view
            +schema: staging
        intermediate:
          +materialized: view
          +schema: intermediate
        marts:
          +materialized: view
          +schema: reporting
    ```
    
    **Staging Layers**
    
    Example file `models/staging/networkrail/_src.yml` which also checks for “Freshness” of the data.
    
    **Note** : Also change the Database name to your own GCP Project ID.
    
    ```yaml
    version: 2
    
    sources:
      - name: networkrail
        schema: networkrail
        database: YOUR_GCP_PROJECT_ID
    
        tables:
          - name: movements
            description: Network Rail movement data
            columns:
              - name: event_type
                description: Event type
            freshness:
              warn_after: {count: 1, period: hour}
              error_after: {count: 2, period: hour}
            loaded_at_field: actual_timestamp
    ```
    
    We can test Freshness of source by
    
    ```bash
    poetry run dbt source freshness --profiles-dir ..
    ```
    
    At this point we will start creating the Staging Layer with the Staging model that we will create. We will create a file called `models/staging/networkrail/stg_networkrail__movements.sql` And you can use the default code below.
    
    ```sql
    with
    
    source as (
    
        select * from {{ source('networkrail', 'movements') }}
    
    )
    
    , renamed_recasted as (
    
        -- Your code here
    
    )
    
    , final as (
    
        -- Your code here
    
    )
    
    select * from final
    ```
    
    **Testing & Documentation**
    
    In this step, we will write tests and do documentation, such as writing additional descriptions for each field. Using information from [NetworkRail's Open Rail Data Wiki](https://wiki.openraildata.com/index.php?title=Train_Movement)
    
    Below is an example file. `models/staging/networkrail/_models.yml` with Generic Tests such as `accepted_values` and testing that our model must have Columns as specified in the Staging Model and each field should be checked for Data Type. too
    
    ```bash
    version: 2
    
    models:
      - name: stg_networkrail__movements
        description: Staging model for Network Rail movement data
        columns:
          - name: event_type
            description: Event type
            tests:
              - not_null
              - accepted_values:
                  values: ['ARRIVAL', 'DEPARTURE']
              - dbt_expectations.expect_column_to_exist
              - dbt_expectations.expect_column_values_to_be_of_type:
                  column_type: string
          - name: actual_timestamp_utc
            description: Actual timestamp in UTC
            tests:
              - not_null
              - dbt_expectations.expect_column_to_exist
              - dbt_expectations.expect_column_values_to_be_of_type:
                  column_type: timestamp
    ```
    
    In order for us to check the model, we must have fields that we define. Or the field must have a valid Data Type. We can additionally install dbt Pacakge named `dbt_expectations` in the `package.yml` file (create this file at the same level as dbt_project.yml). Enter the code below.
    
    ```yaml
    packages:
      - package: calogica/dbt_expectations
        version: 0.8.5
    ```
    
    then run this command to install dependency
    
    ```bash
    poetry run dbt deps
    ```
    
    At least there should be a test as follows.
    
    - There is a test for `not_null`.
    - There is a subject test. `accepted_values` of various fields
    - There is a test that Columns must exist after Staging is created.
    - There is a test on the Data Type of each field.
    
    When we run a command to test, use the command
    
    ```bash
    poetry run dbt test --profiles-dir ..
    ```
    
    **Note**: If errors occur regarding not being able to find the model. It might be because we haven't yet commanded `dbt run` to create a model on Data Warehouse or BigQuery. Let's execute that command first. Then come back and run the test again.
    
    ### Loading CSV to Data Warehouse using `dbt seed`
    
    Read more about Seeds at [Add Seeds to your DAG](https://docs.getdbt.com/docs/build/seeds)
    
    Let us create a file. `seeds/_seeds.yml` to define the data that we will load, we will put it in the Dataset and add the suffix `_seed` and we also define what Data Type each Column has.
    
    ```yaml
    version: 2
    
    seeds:
      - name: operating_companies
        config:
          schema: seed
          column_types:
            toc_id: string
            company_name: string
    ```
    
    Let us copy the file `csv_files/operating_companies.csv` Then place it in the `seeds` folder and run the command
    
    ```bash
    poetry run dbt seed --profiles-dir ..
    ```
    
    When finished, take a look in BigQuery. There will be a Dataset with the suffix `_seed` and inside there will be a Table created from the CSV file. When finished, we may have another Staging Model for Operating Companies. Create the file `models/staging/networkrail/stg_networkrail__operating_companies.sql`
    
    ```bash
    with
    
    source as (
    
        select * from {{ ref('operating_companies') }}
    
    )
    
    , final as (
    
        select
            toc_id
            , company_name
    
        from source
    
    )
    
    select * from final
    ```
    
    ### Creating Fact Table
    
    It can be seen that the two models can be joined together. We may create a fact model at the Mart Layer, namely `models/marts/fct_movements.sql` using the code below.
    
    Note: If only the selected fields were included when creating the Movements Staging model, Also adjust the fields in this Fact Table to match.
    
    ```bash
    with
    
    movements as (
    
        select * from {{ ref('stg_networkrail__movements') }}
    
    )
    
    , operating_companies as (
    
        select * from {{ ref('stg_networkrail__operating_companies') }}
    
    )
    
    , joined as (
    
        select
            event_type
            , gbtt_timestamp_utc
            , original_loc_stanox
            , planned_timestamp_utc
            , timetable_variation
            , original_loc_timestamp_utc
            , current_train_id
            , delay_monitoring_point
            , next_report_run_time
            , reporting_stanox
            , actual_timestamp_utc
            , correction_ind
            , event_source
            , train_file_address
            , platform
            , division_code
            , train_terminated
            , train_id
            , offroute_ind
            , variation_status
            , train_service_code
            , m.toc_id as toc_id
            , oc.company_name as company_name
            , loc_stanox
            , auto_expected
            , direction_ind
            , route
            , planned_event_type
            , next_report_stanox
            , line_ind
    
        from movements as m
        left join operating_companies as oc
            on m.toc_id = oc.toc_id
    
    )
    
    , final as (
    
        select
            event_type
            , gbtt_timestamp_utc
            , original_loc_stanox
            , planned_timestamp_utc
            , timetable_variation
            , original_loc_timestamp_utc
            , current_train_id
            , delay_monitoring_point
            , next_report_run_time
            , reporting_stanox
            , actual_timestamp_utc
            , correction_ind
            , event_source
            , train_file_address
            , platform
            , division_code
            , train_terminated
            , train_id
            , offroute_ind
            , variation_status
            , train_service_code
            , toc_id
            , company_name
            , loc_stanox
            , auto_expected
            , direction_ind
            , route
            , planned_event_type
            , next_report_stanox
            , line_ind
    
        from joined
    
    )
    
    select * from final
    ```
    
    Or if you want to put the parts that we joined together into the Intermediate model, you can as well, in case in the future someone comes and uses this model further.
    
    ### Data Models to Answer Business Questions
    
    When this step is reached We are able to bring Data Models at the Mart to answer business questions. The questions will be as follows.
    
    - Which train has the highest number of off route records? (`train_with_highest_number_of_off_route_records.sql`)
    - Which operating company has the highest number of on time/late trains in the last 3 days? (`operating_company_that_has_highest_number_of_late_trains.sql` and `operating_company_that_has_highest_number_of_on_time_trains.sql`)
    - Which train has never been late and off route? (`trains_that_have_never_been_late_or_off_route.sql`)
    ⚠️ HINT: Try using `array_agg()`.
    - [Optional] Which hour of each day has the highest number of late trains? (`hours_of_each_day_with_highest_number_of_late_trains.sql`)
    ⚠️ HINT: Try using Window Function like `row_number()` it helps.
    
    Once the Data Models are complete, we might try looking at the Data Catalog and Documentation. ours using the command
    
    ```bash
    poetry run dbt docs generate --profiles-dir ..
    poetry run dbt docs serve --profiles-dir ..
    ```
    
    The final Data Lineage will look like after we have a model that answers the questions above. It will look something like this. (Here, if you get a different Data Lineage look, don't worry. The goal is to let us know that each model What model did it come from? And what data does each model use?)
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%206.png)
    
    (but without orange box)
    
    ### Scheduling dbt
    
    We will create a Connection to connect to Google Cloud and name it `networkrail_dbt_bigquery_conn` and in the Keyfile JSON field, let us copy the data inside our Keyfile file and paste it.
    
    As for the code to schedule the dbt project, use the code below (change the Owner name and Schema name to your own). Create a file named `dags/networkrail_dbt_dag.py`
    
    ```python
    from airflow.utils import timezone
    from cosmos.providers.dbt import DbtDag
    
    default_args = {
        "owner": "Chaphowasit Big",
        "start_date": timezone.datetime(2023, 5, 1),
    }
    networkrail_dbt_dag = DbtDag(
        dag_id="networkrail_dbt_dag",
        schedule_interval="@hourly",
        default_args=default_args,
        conn_id="networkrail_dbt_bigquery_conn",
        catchup=False,
        dbt_project_name="networkrail",
        dbt_args={
            "schema": "dbt_big"
        },
        dbt_root_path="/opt/airflow/dbt",
        max_active_runs=1,
        tags=["2023", "networkrail", "dbt"],
    )
    ```
    
    The image of the Data Models that Airflow loads and displays as a Graph will look something like this.
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%207.png)
    
    ## Creating a Dashboard
    
    Using Looker Studio, we create a dashboard for analyzing the Network Rail data we load. At least I would like to have a Line Chart that shows the proportion of data flow over time and a Scorecard that explains the following 6 data points.
    
    - Record Count: Total number of records.
    - Late Count: Number of records with Variation Status as “LATE”.
    - On Time Count: Number of records with Variation Status set to “ON TIME”.
    - Early Count: Number of records with Variation Status as “EARLY”.
    - Off Route Count: Number of records with Variation Status as “OFF ROUTE”.
    - % On Time: Number of records with Variation Status of “EARLY” and “ON TIME” divided by the total number of records.
    
    ⚠️ *HINT: You must add an additional Field. Try using the formula COUNT() + IF() or SUM() + IF(), for example*
    
    ```bash
    SUM(IF(variation_status="EARLY",1,0))
    ```
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%208.png)
    
    ### Add Exposure to Data Catalog
    
    You can read more about Exposures at [Add Exposures to your DAG](https://docs.getdbt.com/docs/build/exposures).
    
    Let us create a file. `models/marts/_exposures.yml` then use the code below.
    
    ```yaml
    version: 2
    exposures:
    
      - name: networkrail_train_movement_data
        label: Network Rail Train Movement Data
        type: dashboard
        maturity: high
        url: https://bi.tool/dashboards/1  # Change to your dashboard's URL
        description: >
          Network Rail Train Movement Data
    
        depends_on:
          - ref('fct_movements')
    
        owner:
          name: Chaphowasit  # Change to your name
          email: ********@gmail.com  # Change to your email
    ```
    
    then run
    
    ```bash
    poetry run dbt docs generate --profiles-dir ..
    poetry run dbt docs serve --profiles-dir ..
    ```
    
    If we go and look at the Data Lineage, we will have an orange Node, which means that we have already written a document that says Dashboard named `networkrail_train_movement_data`. A model called `fct_movements`
    
    ![Untitled](https://github.com/Chaphowasit4522/Portfolio/blob/cd867e9c0b84a4e3d911b864df08285dfb02a8f1/PROJECTS/EndToEndProjects/Pictures/Untitled%206.png)
    
    This will be very useful. That will help us quickly check for errors that occur on the Dashboard to determine which model they are caused by. And we also know which dashboards use which models.
    
    # Summary
    
    This document provides instructions and steps for various tasks related to working with GCP and dbt. It covers topics such as setting up expectations for column values, loading CSV data to a data warehouse using dbt seed, creating fact tables, creating data models to answer business questions, scheduling dbt with Airflow, creating a dashboard using Looker Studio, and adding exposure to the data catalog.
