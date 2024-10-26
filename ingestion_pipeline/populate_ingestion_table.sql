INSERT INTO TECH_DBO.INGEST (
    table_to_change,
    script_text,
    description,
    created_at
)
VALUES (
    'customer',
    'COPY INTO customer_ext FROM @s3_integration/customer/ FILE_FORMAT = CSV_FORMAT;',
    'Inserting rows into customer table.',
    CURRENT_TIMESTAMP()
);

INSERT INTO TECH_DBO.INGEST (
    table_to_change,
    script_text,
    description,
    created_at
)
VALUES (
    'lineitem',
    'COPY INTO lineitem_ext FROM @s3_integration/lineitem/ FILE_FORMAT = CSV_FORMAT;',
    'Inserting rows into lineitem table.',
    CURRENT_TIMESTAMP()
);

INSERT INTO TECH_DBO.INGEST (
    table_to_change,
    script_text,
    description,
    created_at
)
VALUES (
    'nation',
    'COPY INTO nation_ext FROM @s3_integration/nation/ FILE_FORMAT = CSV_FORMAT;',
    'Inserting rows into nation table.',
    CURRENT_TIMESTAMP()
);

INSERT INTO TECH_DBO.INGEST (
    table_to_change,
    script_text,
    description,
    created_at
)
VALUES (
    'orders',
    'COPY INTO orders_ext FROM @s3_integration/orders/ FILE_FORMAT = CSV_FORMAT;',
    'Inserting rows into orders table.',
    CURRENT_TIMESTAMP()
);

INSERT INTO TECH_DBO.INGEST (
    table_to_change,
    script_text,
    description,
    created_at
)
VALUES (
    'part',
    'COPY INTO part_ext FROM @s3_integration/part/ FILE_FORMAT = CSV_FORMAT;',
    'Inserting rows into part table.',
    CURRENT_TIMESTAMP()
);

INSERT INTO TECH_DBO.INGEST (
    table_to_change,
    script_text,
    description,
    created_at
)
VALUES (
    'partsupp',
    'COPY INTO partsupp_ext FROM @s3_integration/partsupp/ FILE_FORMAT = CSV_FORMAT;',
    'Inserting rows into partsupp table.',
    CURRENT_TIMESTAMP()
);

INSERT INTO TECH_DBO.INGEST (
    table_to_change,
    script_text,
    description,
    created_at
)
VALUES (
    'region',
    'COPY INTO region_ext FROM @s3_integration/region/ FILE_FORMAT = CSV_FORMAT;',
    'Inserting rows into region table.',
    CURRENT_TIMESTAMP()
);

INSERT INTO TECH_DBO.INGEST (
    table_to_change,
    script_text,
    description,
    created_at
)
VALUES (
    'supplier',
    'COPY INTO supplier_ext FROM @s3_integration/supplier/ FILE_FORMAT = CSV_FORMAT;',
    'Inserting rows into supplier table.',
    CURRENT_TIMESTAMP()
);