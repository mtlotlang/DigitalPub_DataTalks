

CREATE OR REPLACE TABLE trips_data_all.external_table_partitoned
PARTITION BY
  DATE(tpep_pickup_datetime) AS
SELECT * FROM trips_data_all.external_table;


CREATE OR REPLACE TABLE trips_data_all.external_table_non_partitoned AS
SELECT * FROM trips_data_all.external_table;


-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `taxi-rides-ny.nytaxi.external_yellow_tripdata`
OPTIONS (
  format = 'CSV',
  uris = ['gs://nyc-tl-data/trip data/yellow_tripdata_2021-*.csv', 'gs://nyc-tl-data/trip data/yellow_tripdata_2021-*.csv']
);

-- Check yello trip data
SELECT * FROM trips_data_all.external_table_non_partitoned  limit 10;

-- Create a non partitioned table from external table
CREATE OR REPLACE TABLE trips_data_all.external_table_non_partitoned AS
SELECT * FROM trips_data_all.external_table;


-- Create a partitioned table from external table
CREATE OR REPLACE TABLE trips_data_all.external_table_partitoned
PARTITION BY
  DATE(tpep_pickup_datetime) AS
SELECT * FROM trips_data_all.external_table;

-- Impact of partition
-- Scanning 1.6GB of data
SELECT DISTINCT(VendorID)
FROM trips_data_all.external_table_non_partitoned
WHERE DATE(tpep_pickup_datetime) BETWEEN '2021-01-01' AND '2021-01-30';

-- Scanning ~106 MB of DATA
SELECT DISTINCT(VendorID)
FROM trips_data_all.external_table_partitoned
WHERE DATE(tpep_pickup_datetime) BETWEEN '2021-01-01' AND '2021-01-30';

-- Let's look into the partitons
SELECT table_name, partition_id, total_rows
FROM `trips_data_all.INFORMATION_SCHEMA.PARTITIONS`
WHERE table_name = 'trips_data_all.external_table_partitoned'
ORDER BY total_rows DESC;

-- Creating a partition and cluster table
CREATE OR REPLACE TABLE trips_data_all.external_table_partitoned_clustered
PARTITION BY DATE(tpep_pickup_datetime)
CLUSTER BY VendorID AS
SELECT * FROM trips_data_all.external_table;

-- Query scans 1.1 GB
SELECT count(*) as trips
FROM trips_data_all.external_table_partitoned
WHERE DATE(tpep_pickup_datetime) BETWEEN '2021-01-01' AND '2021-01-31'
  AND VendorID=1;

-- Query scans 864.5 MB
SELECT count(*) as trips
FROM trips_data_all.external_table_partitoned_clustered
WHERE DATE(tpep_pickup_datetime) BETWEEN '2021-01-01' AND '2021-01-31'
  AND VendorID=1;






