CREATE OR REPLACE FILE FORMAT CSV_FORMAT
TYPE = 'CSV'
FIELD_DELIMITER = ';'
field_optionally_enclosed_by='"'
SKIP_HEADER = 1
DATE_FORMAT = 'DD.MM.YY';

CREATE OR REPLACE PROCEDURE create_external_tables_in_core_dwh(message VARCHAR)
RETURNS VARCHAR NOT NULL
LANGUAGE SQL
AS
BEGIN
    drop external table region_ext;
    create external table region_ext
    (
      r_regionkey INTEGER,
      r_name      CHAR(25),
      r_comment   VARCHAR(152)
    )
    LOCATION = ('s3://your-bucket-name/region/')
    FILE_FORMAT = CSV_FORMAT;
    
    
    drop external table nation_ext;
    create external table nation_ext
    (
      n_nationkey INTEGER not null,
      n_name      CHAR(27),
      n_regionkey INTEGER,
      n_comment   VARCHAR(155)
    )
    LOCATION = ('s3://your-bucket-name/nation/')
    FILE_FORMAT = CSV_FORMAT;
    
    
    drop external table supplier_ext;
    create external table supplier_ext
    (
      s_suppkey   INTEGER not null,
      s_name      CHAR(25),
      s_address   VARCHAR(40),
      s_nationkey INTEGER,
      s_phone     CHAR(15),
      s_acctbal   FLOAT8,
      s_comment   VARCHAR(101)
    )
    LOCATION = ('s3://your-bucket-name/supplier/')
    FILE_FORMAT = CSV_FORMAT;
    
    
    drop external table orders_ext;
    create external table orders_ext
    (
      o_orderkey      INTEGER not null,
      o_custkey       INTEGER not null,
      o_orderstatus   CHAR(1),
      o_totalprice    FLOAT8,
      o_orderdate     DATE,
      o_orderpriority CHAR(15),
      o_clerk         CHAR(15),
      o_shippriority  INTEGER,
      o_comment       VARCHAR(79)
    )
    LOCATION = ('s3://your-bucket-name/orders/')
    FILE_FORMAT = CSV_FORMAT;
    
    
    drop external table partsupp_ext;
    create external table partsupp_ext
    (
      ps_partkey    INTEGER not null,
      ps_suppkey    INTEGER not null,
      ps_availqty   INTEGER,
      ps_supplycost FLOAT8 not null,
      ps_comment    VARCHAR(199)
    )
    LOCATION = ('s3://your-bucket-name/partsupp/')
    FILE_FORMAT = CSV_FORMAT;
    
    
    drop external table part_ext;
    create external table part_ext
    (
      p_partkey     INTEGER not null,
      p_name        VARCHAR(55),
      p_mfgr        CHAR(25),
      p_brand       CHAR(10),
      p_type        VARCHAR(25),
      p_size        INTEGER,
      p_container   CHAR(10),
      p_retailprice INTEGER,
      p_comment     VARCHAR(23)
    )
    LOCATION = ('s3://your-bucket-name/part/')
    FILE_FORMAT = CSV_FORMAT;
    
    
    drop external table customer_ext;
    create external table customer_ext
    (
      c_custkey    INTEGER not null,
      c_name       VARCHAR(25),
      c_address    VARCHAR(40),
      c_nationkey  INTEGER,
      c_phone      CHAR(15),
      c_acctbal    FLOAT8,
      c_mktsegment CHAR(10),
      c_comment    VARCHAR(117)
    )
    LOCATION = ('s3://your-bucket-name/customer/')
    FILE_FORMAT = CSV_FORMAT;
    
    
    drop external table lineitem_ext;
    create external table lineitem_ext
    (
      l_orderkey      INTEGER not null,
      l_partkey       INTEGER not null,
      l_suppkey       INTEGER not null,
      l_linenumber    INTEGER not null,
      l_quantity      INTEGER not null,
      l_extendedprice FLOAT8 not null,
      l_discount      FLOAT8 not null,
      l_tax           FLOAT8 not null,
      l_returnflag    CHAR(1),
      l_linestatus    CHAR(1),
      l_shipdate      DATE,
      l_commitdate    DATE,
      l_receiptdate   DATE,
      l_shipinstruct  CHAR(25),
      l_shipmode      CHAR(10),
      l_comment       VARCHAR(44)
    )
    LOCATION = ('s3://your-bucket-name/lineitem/')
    FILE_FORMAT = CSV_FORMAT;

  RETURN 'External tables in CORE_DWH were created.';
END;

CALL create_external_tables_in_core_dwh('');
