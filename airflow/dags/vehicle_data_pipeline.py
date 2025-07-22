from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from datetime import datetime
import os
import sys

# Add the scripts directory to the Python path
# This allows Airflow to find our ingestion script
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../../scripts/ingestion')))
from ingest_vehicle_data import ingest_data

with DAG(
    dag_id='vehicle_data_ingestion_pipeline',
    start_date=datetime(2023, 1, 1),
    schedule_interval=None,  # Manually triggered for now
    catchup=False,
    tags=['vehicle_data', 'ingestion'],
) as dag:
    ingest_sample_data = PythonOperator(
        task_id='ingest_sample_vehicle_data',
        python_callable=ingest_data,
        op_kwargs={
            'file_path': os.path.abspath(os.path.join(os.path.dirname(__file__), '../../data/raw/sample_vehicle_data.json'))
        },
    )

    run_dbt_models = BashOperator(
        task_id='run_dbt_models',
        bash_command='cd /usr/local/airflow/dbt_project && ' \
                     'DBT_PROFILES_DIR=. ' \
                     'POSTGRES_HOST={{ conn.postgres_default.host }} ' \
                     'POSTGRES_PORT={{ conn.postgres_default.port }} ' \
                     'POSTGRES_DB={{ conn.postgres_default.schema }} ' \
                     'POSTGRES_USER={{ conn.postgres_default.login }} ' \
                     'POSTGRES_PASSWORD={{ conn.postgres_default.password }} ' \
                     'dbt run',
        env={
            'PATH': '/usr/local/airflow/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        },
    )

    ingest_sample_data >> run_dbt_models