CREATE TABLE TECH_DBO.INGEST (
  script_id INT AUTOINCREMENT PRIMARY KEY,
  script_text STRING,
  description STRING,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE TECH_DBO.INGEST_LOG (
  log_id INT AUTOINCREMENT PRIMARY KEY,
  script_id INT,
  rows_written INT,
  rows_updated INT,
  execution_time TIMESTAMP,
  status STRING,
  error_details STRING,
  FOREIGN KEY (script_id) REFERENCES TECH_DBO.INGEST(script_id)
);