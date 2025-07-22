# Project Folder Structure

This document outlines the recommended folder structure for the Vehicle Specifications Data Storage System. This structure promotes organization, separation of concerns, and scalability for a data project leveraging Python, dbt, PostgreSQL, and Apache Airflow.

```
.
├── README.md                 # Overall project README
├── requirements.txt          # Python dependencies (managed by UV)
├── .env                      # Environment variables (e.g., database credentials, API keys)
├── docs/
│   ├── DESIGN_DOCUMENTATION.md     # Data model design document
│   ├── SOLUTION_DOCUMENTATION.md   # Overall architecture and solution document
│   ├── IMPLEMENTATION_TASKS.md     # Detailed agile task list
│   └── README.md                   # Documentation specific README
├── data/
│   ├── raw/                  # Raw ingested data (e.g., CSVs, temporary files from ingestion)
│   └── processed/            # Processed data outputs (if any, e.g., aggregated reports, exports)
├── scripts/
│   ├── ingestion/            # Python scripts for data ingestion
│   │   ├── __init__.py
│   │   └── ingest_vehicle_data.py  # Example script for extracting and loading raw data
│   ├── utils/                # Common utility functions for Python scripts
│   │   ├── __init__.py
│   │   └── db_connector.py         # Database connection helper
│   └── run_dbt.py            # Python script to programmatically trigger dbt runs (alternative to Airflow)
├── dbt_project/              # Root directory for the dbt project
│   ├── models/
│   │   ├── staging/          # Staging models (light transformations, e.g., raw data cleaned)
│   │   │   └── stg_vehicle_data.sql
│   │   └── core/             # Core models (final transformed tables based on the data model)
│   │       ├── vehicle_trims.sql
│   │       ├── performance_specs.sql
│   │       ├── dimensions_capacity.sql
│   │       ├── exterior_features.sql
│   │       ├── interior_features.sql
│   │       ├── safety_features.sql
│   │       ├── pricing_availability.sql
│   │       └── schema.yml    # dbt model definitions, descriptions, and tests
│   ├── macros/               # Custom dbt macros (reusable SQL snippets)
│   ├── seeds/                # Static data files for dbt (e.g., lookup tables)
│   ├── analyses/             # Ad-hoc dbt analyses (not part of core models)
│   ├── tests/                # Custom dbt tests (beyond generic tests)
│   ├── dbt_project.yml       # dbt project configuration
│   └── profiles.yml          # dbt database connection profiles (often kept outside version control or managed via env vars)
├── notebooks/                # Jupyter notebooks for EDA, analysis, and prototyping
│   ├── exploratory_analysis.ipynb
│   └── data_validation.ipynb
├── airflow/                  # Apache Airflow DAGs directory
│   └── dags/
│       └── vehicle_data_pipeline.py  # Example Airflow DAG for orchestrating ingestion and dbt
└── tests/                    # Unit/integration tests for Python scripts
    ├── __init__.py
    └── test_ingestion.py
```

**Explanation of Directories:**

*   `.`: The root directory of the project.
*   `README.md`: A high-level overview of the project.
*   `requirements.txt`: Lists all Python package dependencies, to be installed using `uv pip install -r requirements.txt`.
*   `.env`: Stores environment-specific variables (e.g., database credentials, API keys). This file should be excluded from version control (`.gitignore`).
*   `docs/`: Contains all project documentation, including design, solution, and implementation tasks.
*   `data/`: For storing raw and processed data files that are not directly in the database.
*   `scripts/`: Houses all Python scripts for various data operations, organized by function (ingestion, utilities).
*   `dbt_project/`: The standard dbt project structure, containing models, tests, macros, and configurations.
*   `notebooks/`: Dedicated for Jupyter notebooks used for interactive data exploration, analysis, and prototyping.
*   `airflow/`: Contains the Airflow DAGs (Directed Acyclic Graphs) for workflow orchestration.
*   `tests/`: For unit and integration tests related to Python code.

This structure provides a clear separation of concerns, making it easier to navigate, develop, and maintain the project.

Are you satisfied with this proposed folder structure? If so, we can now switch to Code mode to begin implementing the first tasks, starting with setting up the PostgreSQL database and the dbt project.