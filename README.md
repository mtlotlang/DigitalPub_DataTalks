# DigitalPub_DataTalks
DATA ENGINEERING
# Week 7,8 & 9: Project 
Project for Data Engineering Zoomcamp by DPHI 

[Dataset](https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2021-01.csv) - Data of trips taken by taxis in New York City Year 2021


# **DigitalPub Datatalks**

Dataset fields;

tripid  
VendorID    
pickup_datetime    
dropoff_datetime    
Passenger_count    
Trip_distance    
Pickup_locationid   
dropoff_locationid    
RateCodeID     
Store_and_fwd_flag        
Dropoff_longitude   
Dropoff_latitude   
Payment_type         
payment_type_description   
Fare_amount             
Improvement_surcharge   
Tip_amount            
Tolls_amount     
Total_amount     
         

# Problem Statement

For this project, i have chosen this dataset NYC taxi trip in new york. This data set is available on [Dataset](https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2021-01.csv)  and updated every monthly . The objective was to develop dashboard consisting trip summary & distribution by service type..


# Data Pipeline

Data pipeline used with batch which is run periodically (monthly)

- Create Data Pipeline :
Steps -  download_dataset_task >> format_to_parquet_task (Change format from CSV to parquet) >> local_to_gcs_task >> bigquery_external_table_task (upload parquet to Data Lake/GCS) 

# Technologies

- Cloud : GCP
- IaC : Terraform for making Bucket in GCS & Config on BigQuery
- Workflow orchestration : Runnning Airflow on container(Docker)
- Data Warehouse : BigQuery

# Transformation

- Just doing some simple SQL Transformation in DBT

# Dashboard

Create dashboard with Data Studio & Metabase Tiles for taxi trip dataset year 2021
- Summaryof total trips (scorecard)
- Distribution by servicetype- amount of trips per day and service type (Linear time series & Pie)
- Monthly and Year summary trip (Bar)
-Trips per pickup zones (tabular with heatmap)



[Dashboard](https://datastudio.google.com/reporting/c73704e3-e0c8-47f2-9b05-742ca60c8f98/page/az9qC)

