CREATE OR REPLACE PROCEDURE resume_ingestion_tasks()
RETURNS VARCHAR NOT NULL
LANGUAGE SQL
AS
BEGIN
    ALTER TASK customer_task() RESUME;
    ALTER TASK lineitem_task() RESUME;
    ALTER TASK nation_task() RESUME;
    ALTER TASK order_task() RESUME;
    ALTER TASK part_task() RESUME;
    ALTER TASK partsupp_task() RESUME;
    ALTER TASK region_task() RESUME;
    ALTER TASK supplier_task() RESUME;

    RETURN 'Ingestion tasks were started.'
END;

CREATE TASK run_ingestion_task
WAREHOUSE = your_warehouse
SCHEDULE = '5 MINUTE' -- Every 5 minutes
AS
CALL process_ingest_scripts();