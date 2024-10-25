CREATE TASK run_ingestion_task
WAREHOUSE = your_warehouse
SCHEDULE = '5 MINUTE' -- Every 5 minutes
AS
CALL process_ingest_scripts();