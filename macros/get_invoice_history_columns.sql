{% macro get_invoice_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "due_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "closed_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "account_id", "datatype": dbt_utils.type_string()},
    {"name": "previous_invoice_id", "datatype": dbt_utils.type_string()},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "origin", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "number", "datatype": dbt_utils.type_string()},
    {"name": "collection_method", "datatype": dbt_utils.type_string()},
    {"name": "po_number", "datatype": dbt_utils.type_string()},
    {"name": "net_terms", "datatype": dbt_utils.type_string()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "balance", "datatype": dbt_utils.type_int()},
    {"name": "paid", "datatype": dbt_utils.type_int()},
    {"name": "total", "datatype": dbt_utils.type_int()},
    {"name": "subtotal", "datatype": dbt_utils.type_int()},
    {"name": "refundable_amount", "datatype": dbt_utils.type_int()},
    {"name": "discount", "datatype": dbt_utils.type_int()},
    {"name": "tax", "datatype": dbt_utils.type_int()},
    {"name": "tax_type", "datatype": dbt_utils.type_string()},
    {"name": "tax_region", "datatype": dbt_utils.type_string()},
    {"name": "tax_rate", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
