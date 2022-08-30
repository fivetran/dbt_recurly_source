{% macro get_subscription_change_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "plan_id", "datatype": dbt_utils.type_string()},
    {"name": "subscription_id", "datatype": dbt_utils.type_string()},
    {"name": "object", "datatype": dbt_utils.type_string()},
    {"name": "unit_amount", "datatype": dbt_utils.type_float()},
    {"name": "quantity", "datatype": dbt_utils.type_int()},
    {"name": "activate_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "activated", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "deleted_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
