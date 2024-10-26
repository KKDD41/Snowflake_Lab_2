CREATE OR REPLACE PROCEDURE execute_ingestion_script(specific_table STRING)
RETURNS STRING
LANGUAGE SQL
AS
BEGIN
  DECLARE script_to_execute AS STRING;
  DECLARE script_id AS INT;
  DECLARE rows_affected AS INT;
  DECLARE error_message AS STRING;
  DECLARE status_text AS STRING;

  SET script_to_execute = (
        SELECT script_text
        FROM TECH_DBO.INGEST
        WHERE table_to_change = specific_table
        ORDER BY created_at DESC
        LIMIT 1
  );
  SET script_id = (
        SELECT script_id
        FROM TECH_DBO.INGEST
        WHERE table_to_change = specific_table
        ORDER BY created_at DESC
        LIMIT 1
  );


  IF script_to_execute IS NOT NULL THEN
    EXECUTE IMMEDIATE script_to_execute;

    SET rows_affected = SQLROWCOUNT;
    SET status_text = 'Success';

    INSERT INTO TECH_DBO.INGEST_LOG (script_id, rows_affected, status_text);
    RETURN 'Script executed successfully.';
  ELSE
    SET rows_affected = 0;
    SET status_text = 'Fail';

    INSERT INTO TECH_DBO.INGEST_LOG (script_id, rows_affected, status_text);
    RETURN 'No script found for the specified table.';
  END IF;
END;