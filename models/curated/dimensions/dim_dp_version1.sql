{{
    config(
        materialized='table',
        unique_key='VERSION_KEY',
        dist='all',
        sort='VERSION_KEY',
        sql_header=create_table_with_identity(
            this,
            [
                {'name': 'VERSION_KEY', 'type': 'INTEGER'},
                {'name': 'VERSION_NAME', 'type': 'VARCHAR(255)'},
                {'name': 'VERSION_TYPE', 'type': 'VARCHAR(255)'}
            ],
            'VERSION_KEY'
        )
    )
}}
 
SELECT
    VERSION_NAME as version_name,
    VERSION_TYPE as version_type
FROM {{ source('raw_data', 'DIM_DP_VERSION1') }}