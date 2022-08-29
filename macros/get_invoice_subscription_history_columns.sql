{% macro get_invoice_subscription_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "invoice_id", "datatype": dbt_utils.type_string()},
    {"name": "invoice_updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "subscription_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
