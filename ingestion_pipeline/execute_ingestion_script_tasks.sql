CREATE OR REPLACE TASK TECH_DBO.customer_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('CORE_DWH.customer_stream')
AS
  CALL execute_ingestion_script('customer');

CREATE OR REPLACE TASK TECH_DBO.lineitem_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('CORE_DWH.lineitem_stream')
AS
  CALL execute_ingestion_script('lineitem');

CREATE OR REPLACE TASK TECH_DBO.nation_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('CORE_DWH.nation_stream')
AS
  CALL execute_ingestion_script('nation');

CREATE OR REPLACE TASK TECH_DBO.orders_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('CORE_DWH.orders_stream')
AS
  CALL execute_ingestion_script('orders');

CREATE OR REPLACE TASK TECH_DBO.part_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('CORE_DWH.part_stream')
AS
  CALL execute_ingestion_script('part');

CREATE OR REPLACE TASK TECH_DBO.partsupp_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('CORE_DWH.partsupp_stream')
AS
  CALL execute_ingestion_script('partsupp');

CREATE OR REPLACE TASK TECH_DBO.region_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('CORE_DWH.region_stream')
AS
  CALL execute_ingestion_script('region');

CREATE OR REPLACE TASK TECH_DBO.supplier_task
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = '1 MINUTE'
WHEN
  SYSTEM$STREAM_HAS_DATA('CORE_DWH.supplier_stream')
AS
  CALL execute_ingestion_script('supplier');