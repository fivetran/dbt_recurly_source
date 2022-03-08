{% macro get_plan_currency_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "plan_id", "datatype": dbt_utils.type_string()},
    {"name": "plan_updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "setup_fees", "datatype": dbt_utils.type_float()},
    {"name": "unit_amount", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
