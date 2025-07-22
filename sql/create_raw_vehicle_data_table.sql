CREATE TABLE IF NOT EXISTS raw_vehicle_data (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    ingestion_timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    source_file TEXT,
    raw_json JSONB
);