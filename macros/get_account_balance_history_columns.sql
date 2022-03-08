{% macro get_account_history_columns() %}

{% set columns = [

    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "account_id", "datatype": dbt_utils.type_string()},
    {"name": "account_updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "past_due", "datatype": "boolean"},
    {"name": "amount", "datatype": dbt_utils.type_int()},

] %}

{{ return(columns) }}

{% endmacro %}