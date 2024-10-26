CREATE OR REPLACE PROCEDURE DWH.TECH_DBO."SP_INGEST"("p_input_param" varchar(255))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS 'let v_sql_command;
     
    ///////////////////////////
    // Declare INGEST VARIABLES


    /////////////////////////////////
    // Declare LOG VARIABLES


    ////////////////////////////////
    // FUNCTION WRITE PROCESSING LOG
    function f_write_log ( 
                         )
    
    {
      v_sql_stmt = snowflake.createStatement( { sqlText: `INSERT INTO INGEST_LOG (col1, col2, col3.....)
                                                          VALUES ( ?, ?, ?, ....)
                                                          ;`
                                                          , binds: [p_col1, p_col2, p_col3,....].map(
                                                                        function(x){return x === undefined ? null : x}
                                                                        ) 
                                              } );
      v_sql_stmt.execute();
      return '''';
    }
    
    /////////////////////////////////
    // FUNCTION RESET VARIABLE VALUES
    function f_reset_variables ()
    {
      v_sql_statement_cursor_for_loop             = undefined;
      v_example1                                  = undefined;
      v_example2                                  = undefined;
      v_example3                                  = undefined;
	  ...
      return '''';
    }
    try {
      ///////////////////////
      // Check Params on NULL
      if ( p_input_param == undefined ) {
       throw "''Params cannot be null''"
      }
      /////////////////////
      // Declare query variables
      let v_sql_statement;
      let v_result;
      let loop;
      
    
      if (p_input_param != ''-1'') {
        //////////////////////////////////////////////////////
        // Declare CURSOR FOR LOOP SQL STATEMENT and VARIABLES
        let v_loop = snowflake.createStatement( { sqlText: "SELECT * FROM tab1 WHERE PARAM = ?", binds: [p_input_param] } );
        let v_result_cursor_for_loop;
        let v_sql_statement;
        
    
        //////////////////////////////////
        // Declare INSERT INTO SQL STATEMENT
        v_result_cursor_for_loop = v_loop.execute();
        //////////////////////
        // LOOP THROUGH CURSOR
        while ( v_result_cursor_for_loop.next() ) {
          v_var1                                  = v_result_cursor_for_loop.getColumnValue(1);
          v_var2                                  = v_result_cursor_for_loop.getColumnValue(2);
          v_var3                                  = v_result_cursor_for_loop.getColumnValue(3);
          ...
          
          
          ////////////////////
          // INGEST FLAG CHECK
          if ((check!=0)) 
		  {
           
            ///////////////////////////////////////
            // CUSTOM DELETE ACTION (IF APPLICABLE)
            if ( variable_for_delete != undefined ) {
            v_sql_statement = snowflake.createStatement( { sqlText: variable_for_delete } );
            v_sql_statement.execute();
            }
            
            ////////////////
            // INSERT ACTION
            v_sql_statement = snowflake.createStatement( { sqlText: variable_for_insert } );
            v_result = v_sql_statement.execute();
            v_result.next();
            get_written_rows = v_result.getColumnValue(1);
            get_updated_rows = v_result.getColumnValue(2);
			//set logging variables
                if (get_written_rows => 0 && get_updated_rows > 0) {
                    //here set for if condition the logs variables which will be written to log table
                    }
            
            
                }
                else { 
					//once again set for else condition the logs variables which will be written to log table
                 };
          
          ///////////////////////////////////////////////
          // WRITE LOG
          
          f_write_log ( col1, col2, col3);
          continue;
        }
                 
        ////////////////////////
        // RESET VARIABLE VALUES
        f_reset_variables ();
      }; // end LOOP THROUGH CURSOR 
      return ''Done'';
    }   
    catch (err)  {
      return "SP_ETL_STG_DWH_COPY Error: " + err;
	  //here you can also set logs variables for error
      v_ERROR_LOG = err;
      f_write_log ( col1, col2, col3);
    }
';