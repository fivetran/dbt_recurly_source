{% macro get_account_history_columns() %}

{% set columns = [

    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "account_id", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "cost_currency", "datatype": dbt_utils.type_string()},
    {"name": "cost_account", "datatype": dbt_utils.type_string()},
    {"name": "channel", "datatype": dbt_utils.type_string()},
    {"name": "subchannel", "datatype": dbt_utils.type_string()},
    {"name": "campaign", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},

] %}

{{ return(columns) }}

{% endmacro %}