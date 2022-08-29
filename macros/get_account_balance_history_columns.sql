03:08:20  {% macro get_account_balance_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "account_id", "datatype": dbt_utils.type_string()},
    {"name": "account_updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "past_due", "datatype": "boolean"}
] %}

{{ return(columns) }}

{% endmacro %}
