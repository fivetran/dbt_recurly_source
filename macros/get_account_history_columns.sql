{% macro get_account_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "deleted_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "code", "datatype": dbt_utils.type_string()},
    {"name": "bill_to", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "username", "datatype": dbt_utils.type_string()},
    {"name": "first_name", "datatype": dbt_utils.type_string()},
    {"name": "last_name", "datatype": dbt_utils.type_string()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "cc_emails", "datatype": dbt_utils.type_string()},
    {"name": "company", "datatype": dbt_utils.type_string()},
    {"name": "vat_number", "datatype": dbt_utils.type_string()},
    {"name": "tax_exempt", "datatype": "boolean"},
    {"name": "account_country", "datatype": dbt_utils.type_string()},
] %}

{{ return(columns) }}

{% endmacro %}
