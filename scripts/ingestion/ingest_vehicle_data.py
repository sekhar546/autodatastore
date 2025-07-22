import os
import json
import psycopg2
from psycopg2 import extras

def ingest_data(file_path):
    """
    Reads a JSON file and ingests its content into the raw_vehicle_data table.
    """
    try:
        # Load environment variables
        db_host = os.getenv('POSTGRES_HOST')
        db_port = os.getenv('POSTGRES_PORT')
        db_name = os.getenv('POSTGRES_DB')
        db_user = os.getenv('POSTGRES_USER')
        db_password = os.getenv('POSTGRES_PASSWORD')

        if not all([db_host, db_port, db_name, db_user, db_password]):
            raise ValueError("Missing one or more PostgreSQL environment variables.")

        conn_string = f"host={db_host} port={db_port} dbname={db_name} user={db_user} password={db_password}"
        
        with open(file_path, 'r') as f:
            data = json.load(f)

        with psycopg2.connect(conn_string) as conn:
            with conn.cursor() as cursor:
                for record in data:
                    # Convert the Python dictionary to a JSON string for insertion
                    json_data = json.dumps(record)
                    cursor.execute(
                        "INSERT INTO raw_vehicle_data (source_file, raw_json) VALUES (%s, %s);",
                        (os.path.basename(file_path), json_data)
                    )
            conn.commit()
        print(f"Successfully ingested data from {file_path} into raw_vehicle_data.")

    except FileNotFoundError:
        print(f"Error: File not found at {file_path}")
    except json.JSONDecodeError:
        print(f"Error: Invalid JSON in {file_path}")
    except psycopg2.Error as e:
        print(f"Database error: {e}")
    except ValueError as e:
        print(f"Configuration error: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # For local testing, ensure .env is sourced or variables are set
    # In a production Airflow environment, these would be set by Airflow
    from dotenv import load_dotenv
    load_dotenv(os.path.join(os.path.dirname(__file__), '../../.env'))
    
    sample_file_path = os.path.join(os.path.dirname(__file__), '../../data/raw/sample_vehicle_data.json')
    ingest_data(sample_file_path)