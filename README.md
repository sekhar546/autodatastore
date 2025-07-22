# Canadian Vehicle Specifications Data Storage System

This project implements a robust and scalable data storage system for Canadian vehicle specifications. It is designed to handle diverse and evolving vehicle data, providing a flexible schema for future extensions and optimized querying capabilities.

## Features

*   **Data Ingestion:** Automated scripts to ingest raw vehicle data into a PostgreSQL database.
*   **Data Transformation:** Utilizes dbt (data build tool) for transforming raw data into structured, analytical models.
*   **Flexible Schema:** Employs PostgreSQL's JSONB data type to accommodate `additionalFeatures` and other semi-structured data, allowing for easy schema extension without altering core tables.
*   **Performance Optimization:** Implements GIN indexes on JSONB fields for efficient querying of nested data.
*   **Orchestration:** Leverages Apache Airflow (via Astro CLI) for scheduling and monitoring data pipelines.

## Technologies Used

*   **Database:** PostgreSQL (with JSONB support)
*   **Data Transformation:** dbt (data build tool)
*   **Programming Language:** Python (for scripting and data ingestion)
*   **Dependency Management:** UV (for Python environment management)
*   **Orchestration:** Apache Airflow (managed by Astro CLI)
*   **Containerization:** Docker

## Project Structure

*   `.env`: Environment variables for database connection.
*   `airflow/`: Contains Airflow DAGs and Astro CLI project configuration.
*   `data/`: Stores raw and processed data files.
*   `dbt_project/`: Houses all dbt models, tests, and configurations.
*   `docs/`: Project documentation, including design, solution, and implementation tasks.
*   `notebooks/`: Jupyter notebooks for exploratory data analysis and query examples.
*   `scripts/`: Python scripts for data ingestion and utilities.
*   `sql/`: Raw SQL files for database setup (e.g., table creation).

## Setup Instructions

### Prerequisites

Ensure you have the following installed:

*   **Docker Desktop:** For running PostgreSQL and Airflow containers.
*   **Astro CLI:** For managing the Airflow environment.
*   **Python 3.9+:** With `uv` installed for dependency management.

### 1. Clone the Repository

```bash
git clone <repository_url>
cd <repository_name>
```

### 2. Configure Environment Variables

Create a `.env` file in the root directory of the project with your PostgreSQL connection details. Ensure the `POSTGRES_PORT` matches the port exposed by your Docker PostgreSQL container (typically `5432` for Astro CLI setups).

```
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=vehicle_specs_db
POSTGRES_USER=vehicle_user
POSTGRES_PASSWORD=vehicle_password
```

### 3. Start Astro Services (Airflow & PostgreSQL)

Navigate to the `airflow/` directory and start the Astro development environment. This will bring up Airflow and its associated PostgreSQL database.

```bash
cd airflow/
astro dev start
```

Verify that the PostgreSQL container is running and accessible. The output of `astro dev start` should show the PostgreSQL connection details.

### 4. Set up PostgreSQL Database (User, DB, Extension)

Once the PostgreSQL container is running, connect to it as the `postgres` superuser and create the dedicated database, user, and enable the `uuid-ossp` extension.

```bash
docker exec -it airflow_310f1c-postgres-1 psql -U postgres -c "CREATE USER vehicle_user WITH PASSWORD 'vehicle_password';"
docker exec -it airflow_310f1c-postgres-1 psql -U postgres -c "CREATE DATABASE vehicle_specs_db OWNER vehicle_user;"
docker exec -it airflow_310f1c-postgres-1 psql -U postgres -d vehicle_specs_db -c "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";"
docker exec -it airflow_310f1c-postgres-1 psql -U postgres -d vehicle_specs_db -c "ALTER ROLE vehicle_user SET search_path TO public;"
```
*Note: Replace `airflow_310f1c-postgres-1` with your actual PostgreSQL container name if it differs (you can find it using `docker ps`).*

### 5. Create Raw Data Table

Create the `raw_vehicle_data` table in your PostgreSQL database. This table will store the raw JSON data before dbt transformations.

```bash
docker exec -it airflow_310f1c-postgres-1 psql -U vehicle_user -d vehicle_specs_db -c "$(cat sql/create_raw_vehicle_data_table.sql)"
```
*Note: Ensure you are in the project root directory when running this command, as `sql/create_raw_vehicle_data_table.sql` is relative to the root.*

### 6. Ingest Sample Data

Run the Python ingestion script to load sample data into the `raw_vehicle_data` table.

```bash
python scripts/ingestion/ingest_vehicle_data.py
```

### 7. Run dbt Models

Navigate to the `dbt_project/` directory and run your dbt models. This will create the core analytical tables (including `vehicle_trims` as a materialized view) and apply data quality tests.

```bash
cd dbt_project/
POSTGRES_HOST=localhost POSTGRES_PORT=5432 POSTGRES_DB=vehicle_specs_db POSTGRES_USER=vehicle_user POSTGRES_PASSWORD=vehicle_password dbt run
```
*Note: The environment variables are explicitly set for the `dbt run` command to ensure proper connection.*

### 8. Create GIN Index

Create a GIN index on the `additional_features_json` column of the `vehicle_trims` materialized view for efficient querying of JSONB data.

```bash
docker exec -it airflow_310f1c-postgres-1 psql -U vehicle_user -d vehicle_specs_db -c "CREATE INDEX idx_vehicle_features_gin ON vehicle_trims USING GIN (additional_features_json);"
```

## Usage

### Querying Data

You can connect to the `vehicle_specs_db` database using your preferred SQL client (e.g., `psql`, DBeaver) with the credentials from your `.env` file.

Example queries for `additional_features_json`:

```sql
-- Select vehicles with a sunroof
SELECT * FROM vehicle_trims WHERE additional_features_json->>'hasSunroof' = 'true';

-- List all unique keys in the additional_features_json field
SELECT DISTINCT jsonb_object_keys(additional_features_json) FROM vehicle_trims;
```

### Exploratory Analysis

Open the `notebooks/exploratory_analysis.ipynb` Jupyter Notebook to perform interactive data analysis and explore the transformed data.

## Future Enhancements

*   Implement robust error handling and logging for ingestion scripts.
*   Set up monitoring and alerting for Airflow DAGs.
*   Develop a REST API for data consumption.
*   Explore advanced data quality checks.
*   Implement incremental dbt models for large datasets.
*   Integrate with external data validation services.