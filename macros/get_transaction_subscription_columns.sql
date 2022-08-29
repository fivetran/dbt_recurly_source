{% macro get_transaction_subscription_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "transaction_id", "datatype": dbt_utils.type_string()},
    {"name": "subscription_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
